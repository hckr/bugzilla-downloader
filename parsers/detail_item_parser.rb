# encoding: utf-8

=begin
  Klasa parsera służącego do pobierania szczegółowych danych o zgłoszeniu
=end

require_relative 'base_parser'

class DetailItemParser < BaseParser
  @@subpage_uri = 'show_bug.cgi?format=multiple&id='

  def initialize(id)
    @results = []
    #puts id
    item_html = load_file(@@subpage_uri + id)
  end

  def subpage_uri_by_product_name(name)
    @results.each do |result|
      return result[:subpage_uri] if result[:name] == name
    end
  end

  def uri_name_by_product_name(name)
    @results.each do |result|
      return result[:uri_name] if result[:name] == name
    end
  end

  def product_info_by_product_name(name)
    @results.each do |result|
      return result if result[:name] == name
    end
  end

end