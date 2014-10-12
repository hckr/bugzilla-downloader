# encoding: utf-8

=begin
  Klasa eksportująca dane do pliku w formacie JSON
=end

require_relative 'base_file_exporter'
require 'json'

class JSONFileExporter < BaseFileExporter
  def save(data)
    json = data.to_json
    File.write(@filename, json)
  end
end