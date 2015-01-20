# encoding: utf-8

=begin
  Klasa parsera służącego do wyciągania listy zgłoszeń
=end

require_relative 'base_parser'

# TO NIE POWINNO SIĘ NAZYWAĆ ITEMS-COŚTAM :P

class SelectedItemsParser < BaseParser
  @@subpage_product_uri = 'buglist.cgi?product='
  @@subpage_component_uri = '&component='
  @@all_items_uri = '&query_format=advanced&order=bug_status%2Cpriority%2Cassigned_to%2Cbug_id&limit=0'
  @@special_opts = '&resolution=---&ctype=csv&human=1'

  def initialize(item)
    @results = []
    item_csv = load_file(
      @@subpage_product_uri + item[:product_name] +
      @@subpage_component_uri + item[:subpage_uri] +
      @@all_items_uri + @@special_opts
    )
    item_csv.lines[1..-1].each do |line|
      new_item = {
        :id => line.split(',')[0].strip
      }
      puts new_item[:id]
      @results << new_item
    end
  end
end