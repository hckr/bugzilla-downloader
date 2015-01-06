# encoding: utf-8

=begin
  Klasa parsera służącego do wyciągania listy zgłoszeń
=end

require_relative 'base_parser'

class SelectedItemsParser < BaseParser
  @@subpage_product_uri = 'buglist.cgi?product='
  @@subpage_component_uri = '&component='
  @@all_items_uri = '&product=Core&query_format=advanced&order=bug_status%2Cpriority%2Cassigned_to%2Cbug_id&limit=0'
  def initialize()
    @results = []
  end

  def get_data(item)
    item_html = load_html(@@subpage_product_uri + item[:product_name] + @@subpage_component_uri + item[:subpage_uri] + @@all_items_uri)
    regex_occurences = item_html.scan(/<a href="(show_bug.cgi\?id=(?:.+?))">([0-9]+?)<\/a>/)
    regex_occurences.each do |item_info|
      item_result = {
        :id_uri => item_info[0],
        :id => item_info[1]
      }
      @results << item_result
    end
  end

  def export_to_file()
    open('exported_file.txt', 'w') { |f|
      @results.each{ |x| f.puts(x[:id_uri])}
    }
  end

end