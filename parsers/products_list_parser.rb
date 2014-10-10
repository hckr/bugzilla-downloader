=begin
  Klasa parsera służącego do wyciągania listy projektów
=end

require_relative 'base_parser'

class ProductsListParser < BaseParser
  @@subpage_uri = 'describecomponents.cgi'

  def initialize()
    @results = []
    html = load_html(@@subpage_uri)
    regex_occurences = html.scan(/<a href="(describecomponents.cgi\?product=(?:.+?))">(.+?)<\/a>/)
    regex_occurences.each do |product_info|
      result = {
        :name => HTMLEntities.new.decode(product_info[1]),
        :subpage_uri => product_info[0]
      }
      @results << result
    end
  end

end