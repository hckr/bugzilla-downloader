=begin
  Klasa bazowa dla klas eksportujących dane do pliku
=end

class BaseFileExporter
  def initialize(filename)
    @filename = filename
  end
end