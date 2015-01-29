#!/usr/bin/env ruby
# encoding: utf-8

=begin
  Klasa pobierająca dane.
=end

class Downloader

  def initialize(components_to_be_downloaded)
    @components_to_be_downloaded = components_to_be_downloaded
  end

  def download_products(gui, products_parser, &success_callback)
    thread = Thread.new do
      gui.set_message("Trwa pobieranie listy produktów. Proszę czekać...")
      gui.change_button_state(false)
      gui.clear_products_box()
      gui.clear_components_list()
      gui.progress_bar_clear()
      BaseParser.bugzilla_url = gui.bugzilla_url
      products_parser = ProductsListParser.new(gui)
      products_parser.each do |product|
        gui.add_product_to_box(product[:name])
      end
      success_callback.call(products_parser)
    end
    return thread
  end

  def download_async(progress_update, data, &success_callback)
    thread = Thread.new do
      number_items = 0
      num_max = @components_to_be_downloaded.size
      all_results = []
      final_json = Hash.new
      loop do
        component = @components_to_be_downloaded.shift
        p component
        break unless component
        selected_items_parser = SelectedItemsParser.new(component)
        
        all_results.push(*selected_items_parser.results)
        number_items = number_items + 1
        puts number_items.to_s + ', ' + num_max.to_s
        # sleep 1.5
      end
      num_max = all_results.size
      number_items = 0

      all_results.each { |x|
          detail_item_parser = DetailItemParser.new(x[:id])
          
          single_result = detail_item_parser.get_all_info_array
          
          result_author_full = single_result[:people]["reporter"][:fullname]
          result_author_nick = single_result[:people]["reporter"][:nickname]
          puts single_result[:fields]["creation_ts"][:value]
          result_date = single_result[:fields]["creation_ts"][:value].split(/[ :-]/).map(&:to_i)
          result_date_sum = result_date[0] * 10000 + result_date[1] * 100 + result_date[2]
          result_phrase = single_result[:fields]["short_desc"][:value].to_s.downcase
          if ((data[:author].empty? || (result_author_full != nil && result_author_full.downcase[data[:author]]) || (result_author_nick != nil && result_author_nick.downcase[data[:author]])) && (data[:phrase].empty? || result_phrase.downcase[data[:phrase]]) && (data[:from_date] == 0 || (data[:from_date] <= result_date_sum && data[:to_date] >= result_date_sum)))
            final_json[x[:id]] = detail_item_parser.get_all_info_array()
          end
          number_items = number_items + 1
          progress_update.call(number_items, num_max)
      }
      success_callback.call(final_json)
    end
    return thread
  end
end