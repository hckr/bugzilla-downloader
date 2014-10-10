=begin
  Klasa eksportująca dane do pliku w formacie czytelnym dla człowieka
=end

require_relative 'base_file_exporter'

class HumanReadableFileExporter < BaseFileExporter
  def save(data)
    human_readable = to_human_readable(data)
    File.write(@filename, human_readable)
  end

  protected

  def to_human_readable(data)
    human_readable = ''
    # some formatting here :)
    return human_readable
  end
end