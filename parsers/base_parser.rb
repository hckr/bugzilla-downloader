# encoding: utf-8

=begin
  Klasa bazowa dla parserów
=end

require 'nokogiri'
require 'curb'
require 'forwardable'
require 'uri'
require 'htmlentities'
require 'csv'

class BaseParser
  include Enumerable
  extend Forwardable
  attr_reader :results
  def_delegators :@results, :each, :length
  
  @@bugzilla_url = '' # zmienna klasowa ustawiana w main.rb
  def self.bugzilla_url=(url)
    @@bugzilla_url = url
  end

  protected # dalsze metody są protected

  @@curl = Curl::Easy.new(@@bugzilla_url) do |curl|
    curl.headers['User-Agent'] = 'Mozilla/5.0 (X11; Linux x86_64; rv:32.0) Gecko/20100101 Firefox/32.0'
    curl.ssl_verify_peer = false
    curl.verbose = true
    curl.follow_location = true
    curl.timeout = 30
  end

  def load_file(subpage_uri)
    @@curl.url = @@bugzilla_url + subpage_uri
    @@curl.perform
    return @@curl.body_str.force_encoding('UTF-8')
  end

  def load_dom(subpage_uri)
    html = load_file(subpage_uri)
    dom = Nokogiri::HTML(html)
    dom.encoding = 'UTF-8'
    return dom
  end

end