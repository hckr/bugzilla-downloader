#!/usr/bin/env ruby
# encoding: utf-8

=begin
  Punkt wejścia do aplikacji.
=end

require_relative 'parsers/base_parser'
require_relative 'parsers/products_list_parser'
require_relative 'parsers/components_list_parser'
require_relative 'parsers/selected_items_parser'
require_relative 'parsers/detail_item_parser'
require_relative 'exporters/json_file_exporter'
require_relative 'ui/gui_controller'
require_relative 'downloader'

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

exporting_thread = nil # przydałoby się to trzymać w lepszym miejscu :/

gui.on_export do
  if not exporting_thread
    gui.export_button_text = 'Anuluj eksport'
    gui.progress_bar_clear()
    
    author = gui.author()
    phrase = gui.phrase()
    from_date = 0
    to_date = 0

    entered_data = {
      :author => gui.author(),
      :phrase => gui.phrase(),
      :from_date => 0,
      :to_date => 0
    }

    if (gui.is_date_selected())
        from = gui.from_date.split('.').map(&:to_i)
        to = gui.to_date.split('.').map(&:to_i)
        entered_data[:from_date] = (10000 * from[2]) + (100 * from[1]) + from[0]
        entered_data[:to_date] = (10000 * to[2]) + (100 * to[1]) + to[0]
    end

    downloader = Downloader.new(gui.get_components_to_download())
    final_json = Hash.new
    exporting_thread = downloader.download_async(gui.method(:progress_bar_increment), entered_data) do |final_json|
      # to ogólnie trzeba by później przenieść do jakiegoś eksportera:
      open('exported_file.json', 'w') do |f|
          
        json_file = json_file = JSON.pretty_generate(final_json)
        f.puts(json_file)
      end
      #puts to_date
      gui.clear_components_list()
      exporting_thread = nil
      gui.export_button_text = 'Eksportuj'

      puts 'Zakończono eksport!'
    end
  else
    # chęć anulowania
    exporting_thread.kill
    exporting_thread = nil
    is_exporting = false
    gui.export_button_text = 'Eksportuj'
    gui.progress_bar_clear()
  end
end

gui.show