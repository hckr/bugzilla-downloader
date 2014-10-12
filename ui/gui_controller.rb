# encoding: utf-8

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

  def add_product_to_list(name)
    @ui.productsComboBox.addItem(name)
  end

  def selected_product_index()
    return @ui.productsComboBox.currentIndex
  end

  def selected_product_name()
    return @ui.productsComboBox.currentText.force_encoding('utf-8')
  end

  def show()
    @window.show
    @app.exec
  end
end