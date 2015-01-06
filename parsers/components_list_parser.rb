# encoding: utf-8

=begin
  Klasa parsera służącego do wyciągania listy komponentów
=end

require_relative 'base_parser'

class ComponentsListParser < BaseParser

  def initialize(result)
    @results = []
    result[:components].each do |result|
      @results << result
    end
  end

  def subpage_uri_by_component_name(name)
    @results.each do |result|
      return result[:subpage_uri] if result[:name] == name
    end
    return nil
  end

  def component_info_by_component_name(name)
    @results.each do |result|
      return result if result[:name] == name
    end
    return nil
  end

end