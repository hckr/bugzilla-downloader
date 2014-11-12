# encoding: utf-8

=begin
  Klasa parsera służącego do wyciągania listy projektów
=end

require_relative 'base_parser'

class ComponentListParser < BaseParser
  @@subpage_uri_prefix = 'describecomponents.cgi?product='

  def initialize(product_name)
    @results = []
    product_name.gsub!(' ', '%20')
    html = load_html(@@subpage_uri_prefix + product_name)
    regex_occurences = html.scan(/href="(buglist\.cgi\?product=#{product_name}&amp;component=(.+?)&amp;resolution=---)"/)
    regex_occurences.each do |component_info|
      result = {
        :name => HTMLEntities.new.decode(component_info[1]).gsub('%20', ' '), # HTMLEntites nie dziala w tym wypadku :/
        :subpage_uri => component_info[0]
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