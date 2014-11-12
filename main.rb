#!/usr/bin/env ruby
# encoding: utf-8

=begin
  Punkt wejścia do aplikacji.
=end

require_relative 'parsers/products_list_parser'
require_relative 'parsers/components_list_parser'
require_relative 'ui/gui_controller'

gui = GUIController.new

gui.on_bugzilla_url_select do
  BaseParser.bugzilla_url = gui.bugzilla_url
  products_parser = ProductsListParser.new
  gui.clear_products_list()
  products_parser.each do |product|
    gui.add_product_to_list(product[:name])
  end
end

gui.on_product_select do |product_name|
  if product_name != ''
    components_parser = ComponentListParser.new product_name
    gui.clear_components_list()
    components_parser.each do |component|
      gui.add_component_to_list(component[:name])
    end
  end
end

gui.show