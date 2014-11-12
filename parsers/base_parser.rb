# encoding: utf-8

=begin
  Klasa bazowa dla parserów
=end

require 'nokogiri'
require 'open-uri'
require 'forwardable'
require 'uri'
require 'htmlentities'

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

  def load_html(subpage_uri)
    html = open(
      @@bugzilla_url + subpage_uri,
      'User-Agent' => 'Mozilla/5.0 (X11; Linux x86_64; rv:32.0) Gecko/20100101 Firefox/32.0' # podszywamy się pod Firefoksa
    ).read
    html.force_encoding('utf-8')
    return html
  end

  def load_dom(subpage_uri)
    html = load_html(subpage_uri)
    dom = Nokogiri::HTML(html)
    dom.encoding = 'UTF-8'
    return dom
  end

end