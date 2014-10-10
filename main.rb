#!/usr/bin/env ruby

=begin
  Punkt wejścia do aplikacji.
=end

require_relative 'parsers/base_parser'
require_relative 'parsers/products_list_parser'
require_relative 'exporters/json_file_exporter'

BaseParser.bugzilla_url = 'https://bugzilla.mozilla.org/'

ProductsListParser.new.each do |project|
  puts project[:name] + ': ' + project[:subpage_uri]
end

JSONFileExporter.new('test.json').save({
  :xd => 'xddd',
  :xdd => ':)'
})