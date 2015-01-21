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
    @already_added = []
  end

  def on_bugzilla_url_select()
    @ui.loadProductsButton.connect(SIGNAL :clicked) do
      yield
    end
  end

  def on_product_select()
    @ui.productsComboBox.connect(SIGNAL('currentIndexChanged(const QString&)')) do
      yield
    end
  end

  def on_add_to_list_select()
    @ui.addToListButton.connect(SIGNAL :clicked) do
      yield
    end
  end

  def on_add_all_to_list_select()
    @ui.addAllToListButton.connect(SIGNAL :clicked) do
      yield
    end
  end

  def on_remove_selected_component()
    @ui.removeSelectedButton.connect(SIGNAL :clicked) do
      @already_added.delete_if do |x|
          x[:product_name] + " - " + x[:name] == selected_component_on_list()
      end
      @ui.componentsList.takeItem(@ui.componentsList.currentRow)
    end
  end

  def on_remove_all_components()
    @ui.removeAllButton.connect(SIGNAL :clicked) do
      @already_added.clear
      @ui.componentsList.clear
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

  def author()
    return @ui.authorEdit.displayText
  end

  def phrase()
    return @ui.phraseEdit.displayText
  end

  def is_date_selected()
    return @ui.isDateButton.isChecked()
  end

  def from_date()
    return @ui.dateFromEdit.date().toString("dd.MM.yyyy")
  end

  def to_date()
    return @ui.dateToEdit.date().toString("dd.MM.yyyy")
  end

  def clear_products_box()
    @ui.productsComboBox.clear()
  end

  def add_product_to_box(name)
    @ui.productsComboBox.addItem(name)
  end

  def selected_product_index()
    return @ui.productsComboBox.currentIndex
  end

  def selected_product_name()
    return @ui.productsComboBox.currentText.force_encoding('utf-8')
  end

  def selected_component_on_list()
    return @ui.componentsList.currentItem.text.force_encoding('utf-8')
  end

  def clear_components_box()
    @ui.componentsComboBox.clear()
  end

  def add_component_to_box(name)
    @ui.componentsComboBox.addItem(name)
  end

  def selected_component_index()
    return @ui.componentsComboBox.currentIndex
  end

  def selected_component_name()
    return @ui.componentsComboBox.currentText.force_encoding('utf-8')
  end

  def clear_components_list()
    @ui.componentsList.clear()
    @already_added = []
  end

  def add_to_components_list_full(result)
    unless @already_added.include?(result)
      @already_added.push(result)
      return @ui.componentsList.addItem(selected_product_name + " - " + result[:name])
    end
  end 

  def add_to_components_list_by_name(name)
    unless @already_added.include?(selected_product_name + " - " + name)
      @already_added.push(selected_product_name + " - " + name)
      return @ui.componentsList.addItem(selected_product_name + " - " + name)
    end
  end

  def get_components_to_download()
    return @already_added
  end

  def add_to_components_list()
    unless @already_added.include?(selected_product_name + " - " + selected_component_name)
      @already_added.push(selected_product_name + " - " + selected_component_name)
      return @ui.componentsList.addItem(selected_product_name + " - " + selected_component_name)
    end
  end

  def show()
    @window.show
    @app.exec
  end

  def progress_bar_increment(number, num_max)
    bar_width = (number * 100.0) / num_max
    @ui.progressBar.value = bar_width
  end

  def progress_bar_clear()
    @ui.progressBar.value = 0
  end

  def get_already_added_size()
    return @already_added.size
  end

  def export_button_text=(new_text)
    @ui.exportButton.text = new_text
  end
  
end