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
    count = 0
    without_first_line = item_csv.lines
    if without_first_line
      without_first_line.each do |line|
        new_item = {
          :id => line.split(',')[0].strip,
          :product => line.split(',')[1].strip[0..-1],
          :component => line.split(/","/)[1].strip[0..-1],
          :assignee => line.split(/","/)[2].strip[0..-1],
          :status => line.split(/","/)[3].strip[0..-1],
          :summary => line.split(/","/)[5].strip[0..-1],
          :changed => line.split(/","/)[6].strip[0..-2]
        }
        if (count == 0)
          count = 1
        else
          @results << new_item
        end
      end
    end
  end
end