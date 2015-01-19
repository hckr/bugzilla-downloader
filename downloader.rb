#!/usr/bin/env ruby
# encoding: utf-8

=begin
  Klasa pobierająca dane.
=end

class Downloader

  def initialize(components_to_be_downloaded)
    @components_to_be_downloaded = components_to_be_downloaded
  end

  def download_async(progress_update, &success_callback)
    thread = Thread.new do
      number_items = 0
      num_max = @components_to_be_downloaded.size
      all_results = []
      loop do
        component = @components_to_be_downloaded.shift
        break unless component
        selected_items_parser = SelectedItemsParser.new(component)
        all_results.push(*selected_items_parser.results)
        number_items = number_items + 1
        progress_update.call(number_items, num_max)
        puts number_items.to_s + ', ' + num_max.to_s
      end
      success_callback.call(all_results)
    end
    return thread
  end

end