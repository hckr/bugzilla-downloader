#!/usr/bin/env ruby
# encoding: utf-8

=begin
  Punkt wejścia do aplikacji.
=end

require_relative 'parsers/base_parser'
require_relative 'parsers/products_list_parser'
require_relative 'parsers/components_list_parser'
require_relative 'exporters/json_file_exporter'
require_relative 'ui/gui_controller'

products_parser = nil
components_parser = nil

gui = GUIController.new

gui.on_bugzilla_url_select do
  BaseParser.bugzilla_url = gui.bugzilla_url
  products_parser = ProductsListParser.new
  gui.clear_products_list()
  products_parser.each do |product|
    gui.add_product_to_list(product[:name])
  end
  # JSONFileExporter.new('products_list.json').save(products_parser.results)
end

gui.on_product_select do
components_parser = ComponentsListParser.new(products_parser.uri_name_by_product_name(gui.selected_product_name))
  gui.clear_components_list()
  components_parser.each do |component|
    gui.add_component_to_list(component[:name])
  end
end

gui.on_add_to_list_select do
  gui.add_to_components_list()
end

gui.on_export do
  puts gui.selected_product_name
  puts products_parser.subpage_uri_by_product_name(gui.selected_product_name)
end

gui.show