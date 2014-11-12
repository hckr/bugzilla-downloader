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
    @window.setWindowTitle('Bugzilla Downloader ver. 0.1 pre-alpha')
  end

  def on_bugzilla_url_select(&block)
    @ui.loadProductsButton.connect(SIGNAL('clicked()'), &block)
  end

  def on_product_select(&block)
    @ui.productsComboBox.connect(SIGNAL('currentIndexChanged(QString)')) do |product_name|
      block.call product_name.force_encoding('utf-8')
    end
  end

  def bugzilla_url()
    @ui.bugzillaURLLineEdit.displayText
  end

  def clear_products_list()
    @ui.productsComboBox.clear()
  end

  def clear_components_list()
    @ui.componentsComboBox.clear()
  end

  def add_product_to_list(name)
    @ui.productsComboBox.addItem(name)
  end

  def add_component_to_list(name)
    @ui.componentsComboBox.addItem(name)
  end

  def show()
    @window.show
    @app.exec
  end
end