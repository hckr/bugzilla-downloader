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

  def on_product_select()
    @ui.loadComponentsButton.connect(SIGNAL :clicked) do
      yield
    end
  end

  def on_add_to_list_select()
    @ui.addToListButton.connect(SIGNAL :clicked) do
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


  def clear_components_list()
    @ui.componentsComboBox.clear()
  end

  def add_component_to_list(name)
    @ui.componentsComboBox.addItem(name)
  end

  def selected_component_index()
    return @ui.componentsComboBox.currentIndex
  end

  def selected_component_name()
    return @ui.componentsComboBox.currentText.force_encoding('utf-8')
  end



  def add_to_list(name)
    return @ui.componentsList.insertItem(name)
  end

  def add_to_components_list()
    return @ui.componentsList.addItem(selected_product_name + " - " + selected_component_name)
  end
  def show()
    @window.show
    @app.exec
  end
end