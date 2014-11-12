=begin
** Form generated from reading ui file 'main_window.ui'
**
** Created: r. lis 12 21:33:21 2014
**      by: Qt User Interface Compiler version 4.8.6
**
** WARNING! All changes made in this file will be lost when recompiling ui file!
=end

class Ui_MainWindow
    attr_reader :centralwidget
    attr_reader :verticalLayout
    attr_reader :horizontalLayout
    attr_reader :label
    attr_reader :bugzillaURLLineEdit
    attr_reader :loadProductsButton
    attr_reader :horizontalLayout_2
    attr_reader :label_2
    attr_reader :productsComboBox
    attr_reader :horizontalLayout_4
    attr_reader :label_3
    attr_reader :componentsComboBox
    attr_reader :horizontalLayout_3
    attr_reader :addToListButton
    attr_reader :horizontalLayout_5
    attr_reader :listWidget
    attr_reader :menubar
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(552, 319)
    mainWindow.styleSheet = "QLabel { qproperty-alignment: 'AlignVCenter | AlignRight'; }"
    @centralwidget = Qt::Widget.new(mainWindow)
    @centralwidget.objectName = "centralwidget"
    @verticalLayout = Qt::VBoxLayout.new(@centralwidget)
    @verticalLayout.objectName = "verticalLayout"
    @horizontalLayout = Qt::HBoxLayout.new()
    @horizontalLayout.objectName = "horizontalLayout"
    @label = Qt::Label.new(@centralwidget)
    @label.objectName = "label"
    @sizePolicy = Qt::SizePolicy.new(Qt::SizePolicy::Fixed, Qt::SizePolicy::Preferred)
    @sizePolicy.setHorizontalStretch(0)
    @sizePolicy.setVerticalStretch(0)
    @sizePolicy.heightForWidth = @label.sizePolicy.hasHeightForWidth
    @label.sizePolicy = @sizePolicy
    @label.minimumSize = Qt::Size.new(135, 0)
    @label.maximumSize = Qt::Size.new(135, 16777215)

    @horizontalLayout.addWidget(@label)

    @bugzillaURLLineEdit = Qt::LineEdit.new(@centralwidget)
    @bugzillaURLLineEdit.objectName = "bugzillaURLLineEdit"

    @horizontalLayout.addWidget(@bugzillaURLLineEdit)

    @loadProductsButton = Qt::PushButton.new(@centralwidget)
    @loadProductsButton.objectName = "loadProductsButton"

    @horizontalLayout.addWidget(@loadProductsButton)


    @verticalLayout.addLayout(@horizontalLayout)

    @horizontalLayout_2 = Qt::HBoxLayout.new()
    @horizontalLayout_2.objectName = "horizontalLayout_2"
    @label_2 = Qt::Label.new(@centralwidget)
    @label_2.objectName = "label_2"
    @sizePolicy.heightForWidth = @label_2.sizePolicy.hasHeightForWidth
    @label_2.sizePolicy = @sizePolicy
    @label_2.minimumSize = Qt::Size.new(135, 0)
    @label_2.maximumSize = Qt::Size.new(135, 16777215)
    @label_2.sizeIncrement = Qt::Size.new(100, 0)
    @label_2.styleSheet = ""

    @horizontalLayout_2.addWidget(@label_2)

    @productsComboBox = Qt::ComboBox.new(@centralwidget)
    @productsComboBox.objectName = "productsComboBox"

    @horizontalLayout_2.addWidget(@productsComboBox)


    @verticalLayout.addLayout(@horizontalLayout_2)

    @horizontalLayout_4 = Qt::HBoxLayout.new()
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @label_3 = Qt::Label.new(@centralwidget)
    @label_3.objectName = "label_3"
    @sizePolicy.heightForWidth = @label_3.sizePolicy.hasHeightForWidth
    @label_3.sizePolicy = @sizePolicy
    @label_3.minimumSize = Qt::Size.new(135, 0)
    @label_3.maximumSize = Qt::Size.new(135, 16777215)
    @label_3.styleSheet = ""

    @horizontalLayout_4.addWidget(@label_3)

    @componentsComboBox = Qt::ComboBox.new(@centralwidget)
    @componentsComboBox.objectName = "componentsComboBox"

    @horizontalLayout_4.addWidget(@componentsComboBox)


    @verticalLayout.addLayout(@horizontalLayout_4)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @addToListButton = Qt::PushButton.new(@centralwidget)
    @addToListButton.objectName = "addToListButton"

    @horizontalLayout_3.addWidget(@addToListButton)


    @verticalLayout.addLayout(@horizontalLayout_3)

    @horizontalLayout_5 = Qt::HBoxLayout.new()
    @horizontalLayout_5.objectName = "horizontalLayout_5"
    @listWidget = Qt::ListWidget.new(@centralwidget)
    @listWidget.objectName = "listWidget"

    @horizontalLayout_5.addWidget(@listWidget)


    @verticalLayout.addLayout(@horizontalLayout_5)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 552, 20)
    mainWindow.setMenuBar(@menubar)
    @statusbar = Qt::StatusBar.new(mainWindow)
    @statusbar.objectName = "statusbar"
    mainWindow.statusBar = @statusbar

    retranslateUi(mainWindow)

    Qt::MetaObject.connectSlotsByName(mainWindow)
    end # setupUi

    def setup_ui(mainWindow)
        setupUi(mainWindow)
    end

    def retranslateUi(mainWindow)
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "MainWindow", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("MainWindow", "Adres Bugzilli:", nil, Qt::Application::UnicodeUTF8)
    @bugzillaURLLineEdit.text = Qt::Application.translate("MainWindow", "https://bugzilla.mozilla.org/", nil, Qt::Application::UnicodeUTF8)
    @loadProductsButton.text = Qt::Application.translate("MainWindow", "Za\305\202aduj produkty", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("MainWindow", "Wybierz projekt:", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("MainWindow", "Wybierz komponent:", nil, Qt::Application::UnicodeUTF8)
    @addToListButton.text = Qt::Application.translate("MainWindow", "Dodaj do listy", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

