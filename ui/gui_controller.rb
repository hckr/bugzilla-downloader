=begin
  Klasa sterująca GUI.
=end

require 'Qt4'
require_relative 'main_window_ui.rb'

class GUIController
  attr_reader :ui

  def initialize()
    @app = Qt::Application.new(ARGV)
    @ui = Ui_MainWindow.new
    @window = Qt::MainWindow.new
    @ui.setupUi(@window)
    @products_subpage_uris = Hash.new
  end

  def on_bugzilla_url_select()
    @ui.loadProductsButton.connect(SIGNAL :clicked) do
      yield
    end
  end

  def on_export()
    @ui.exportButton.connect(SIGNAL :clicked) do
      yield
    end
  end

  def bugzilla_url()
    return @ui.bugzillaURLLineEdit.displayText
  end

  def clear_products_list()
    @ui.productsComboBox.clear()
  end

  def add_product_to_list(name, subpage_uri)
    @ui.productsComboBox.addItem(name)
    @products_subpage_uris[name] = subpage_uri
  end

  def selected_product_subpage_uri()
    return @products_subpage_uris[@ui.productsComboBox.currentText]
  end

  def show()
    @window.show
    @app.exec
  end
end