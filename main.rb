#!/usr/bin/env ruby

=begin
  Punkt wejścia do aplikacji.
=end

require_relative 'parsers/base_parser'
require_relative 'parsers/products_list_parser'
require_relative 'exporters/json_file_exporter'
require_relative 'ui/gui_controller'

products_parser = nil

gui = GUIController.new

gui.on_bugzilla_url_select do
  BaseParser.bugzilla_url = gui.bugzilla_url
  products_parser = ProductsListParser.new
  gui.clear_products_list()
  products_parser.each do |product|
    gui.add_product_to_list(product[:name], product[:subpage_uri])
  end
  puts products_parser.results
  JSONFileExporter.new('products_list.json').save(products_parser.results)
end

gui.on_export do
  puts gui.selected_product_subpage_uri
end

gui.show