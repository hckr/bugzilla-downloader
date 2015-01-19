# encoding: utf-8

=begin
  Klasa parsera służącego do wyciągania listy projektów
=end

require_relative 'base_parser'

class ProductsListParser < BaseParser
  @@subpage_product_uri = 'describecomponents.cgi'
  @@subpage_component_uri = 'describecomponents.cgi?product='

  def initialize(html='',gui)
    @results = []
    product_html = load_html(@@subpage_product_uri) if html.length == 0
    product_regex_occurences = product_html.scan(/<a href="(describecomponents.cgi\?product=(?:.+?))">(.+?)<\/a>/)
    num_products = 0
    gui.progress_bar_clear()
    product_regex_occurences.each do |product_info|
      product_result = {
        :name => HTMLEntities.new.decode(product_info[1]),
        :uri_name => product_info[1].gsub("&nbsp;","%20"),
        :subpage_uri => product_info[0],
        :components => Array.new
      }
      component_html = load_html(@@subpage_component_uri + product_result[:uri_name])
      components_regex_occurences = component_html.scan(/href="buglist.cgi\?product=#{product_result[:uri_name]}&amp;component=(.+?)">(.+?)<\/a>/)
      components_regex_occurences.each do |component_info|
        component_result = {
          :product_name => product_result[:uri_name],
          :name => HTMLEntities.new.decode(component_info[1]),
          :uri_name => component_info[1].gsub("&nbsp;", "%20"),
          :subpage_uri => component_info[0].gsub("amp;","")
        }
        product_result[:components].push(component_result)
      end
      num_products = num_products + 1;
      gui.progress_bar_increment(num_products,product_regex_occurences.size)
      @results << product_result
    end
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