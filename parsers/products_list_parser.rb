# encoding: utf-8

=begin
  Klasa parsera służącego do wyciągania listy projektów
=end

require_relative 'base_parser'

class ProductsListParser < BaseParser
  @@subpage_uri = 'describecomponents.cgi'

  def initialize(html='')
    @results = []
    html = load_html(@@subpage_uri) if html.length == 0
    regex_occurences = html.scan(/<a href="(describecomponents.cgi\?product=(?:.+?))">(.+?)<\/a>/)
    regex_occurences.each do |product_info|
      result = {
        :name => HTMLEntities.new.decode(product_info[1]),
        :subpage_uri => product_info[0]
      }
      @results << result
    end
  end

  def subpage_uri_by_product_name(name)
    @results.each do |result|
      return result[:subpage_uri] if result[:name] == name
    end
    return nil
  end

end