#!/usr/bin/env ruby
# encoding: utf-8

=begin
  Punkt wejścia do aplikacji.
=end

require_relative 'parsers/base_parser'
require_relative 'parsers/products_list_parser'
require_relative 'parsers/components_list_parser'
require_relative 'parsers/selected_items_parser'
require_relative 'exporters/json_file_exporter'
require_relative 'ui/gui_controller'

products_parser = nil
components_parser = nil

gui = GUIController.new

gui.on_bugzilla_url_select do
  BaseParser.bugzilla_url = gui.bugzilla_url
  products_parser = ProductsListParser.new(gui)
  gui.clear_products_box()
  products_parser.each do |product|
    gui.add_product_to_box(product[:name])
  end
  # JSONFileExporter.new('products_list.json').save(products_parser.results)
end

gui.on_product_select do
components_parser = ComponentsListParser.new(products_parser.product_info_by_product_name(gui.selected_product_name))
  gui.clear_components_box()
  components_parser.each do |component|
    gui.add_component_to_box(component[:name])
  end
end

gui.on_add_to_list_select do
  components_parser = ComponentsListParser.new(products_parser.product_info_by_product_name(gui.selected_product_name))
  gui.add_to_components_list_full(components_parser.component_info_by_component_name(gui.selected_component_name))
end

gui.on_add_all_to_list_select do
  components_parser = ComponentsListParser.new(products_parser.product_info_by_product_name(gui.selected_product_name))
  components_parser.each do |component|
    #gui.add_to_components_list_by_name(component[:name])
    gui.add_to_components_list_full(component)
  end
end

gui.on_remove_selected_component do

end

gui.on_remove_all_components do

end

gui.on_export do
  number_items = 1
  num_max = gui.get_already_added_size()
  gui.progress_bar_clear()
  selected_items_parser = SelectedItemsParser.new
  result = gui.remove_element
  gui.progress_bar_increment(number_items,num_max)
  while result != nil do
    selected_items_parser.get_data(result)
    result = gui.remove_element
    number_items = number_items + 1
    gui.progress_bar_increment(number_items,num_max)
  end
  selected_items_parser.export_to_file()
  gui.clear_components_list()
  puts 'Zakończono eksport!'
  #puts gui.selected_product_name
  #puts products_parser.subpage_uri_by_product_name(gui.selected_product_name)
end

gui.show