=begin
** Form generated from reading ui file 'main_window.ui'
**
** Created: r. sty 28 18:19:03 2015
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
    attr_reader :addToListButton
    attr_reader :horizontalLayout_4
    attr_reader :label_3
    attr_reader :componentsComboBox
    attr_reader :addAllToListButton
    attr_reader :progressBar
    attr_reader :infoLabel
    attr_reader :componentsList
    attr_reader :horizontalLayout_8
    attr_reader :removeSelectedButton
    attr_reader :removeAllButton
    attr_reader :horizontalLayout_5
    attr_reader :isDateButton
    attr_reader :label_4
    attr_reader :dateFromEdit
    attr_reader :label_5
    attr_reader :dateToEdit
    attr_reader :horizontalLayout_6
    attr_reader :label_6
    attr_reader :authorEdit
    attr_reader :horizontalLayout_7
    attr_reader :label_7
    attr_reader :phraseEdit
    attr_reader :horizontalLayout_3
    attr_reader :exportButton
    attr_reader :menubar
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(569, 479)
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
    @label.minimumSize = Qt::Size.new(100, 0)

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
    @label_2.minimumSize = Qt::Size.new(100, 0)
    @label_2.styleSheet = ""

    @horizontalLayout_2.addWidget(@label_2)

    @productsComboBox = Qt::ComboBox.new(@centralwidget)
    @productsComboBox.objectName = "productsComboBox"
    @sizePolicy1 = Qt::SizePolicy.new(Qt::SizePolicy::Expanding, Qt::SizePolicy::Fixed)
    @sizePolicy1.setHorizontalStretch(0)
    @sizePolicy1.setVerticalStretch(0)
    @sizePolicy1.heightForWidth = @productsComboBox.sizePolicy.hasHeightForWidth
    @productsComboBox.sizePolicy = @sizePolicy1

    @horizontalLayout_2.addWidget(@productsComboBox)

    @addToListButton = Qt::PushButton.new(@centralwidget)
    @addToListButton.objectName = "addToListButton"
    @sizePolicy2 = Qt::SizePolicy.new(Qt::SizePolicy::Minimum, Qt::SizePolicy::Fixed)
    @sizePolicy2.setHorizontalStretch(0)
    @sizePolicy2.setVerticalStretch(0)
    @sizePolicy2.heightForWidth = @addToListButton.sizePolicy.hasHeightForWidth
    @addToListButton.sizePolicy = @sizePolicy2

    @horizontalLayout_2.addWidget(@addToListButton)


    @verticalLayout.addLayout(@horizontalLayout_2)

    @horizontalLayout_4 = Qt::HBoxLayout.new()
    @horizontalLayout_4.objectName = "horizontalLayout_4"
    @label_3 = Qt::Label.new(@centralwidget)
    @label_3.objectName = "label_3"
    @sizePolicy.heightForWidth = @label_3.sizePolicy.hasHeightForWidth
    @label_3.sizePolicy = @sizePolicy

    @horizontalLayout_4.addWidget(@label_3)

    @componentsComboBox = Qt::ComboBox.new(@centralwidget)
    @componentsComboBox.objectName = "componentsComboBox"
    @sizePolicy1.heightForWidth = @componentsComboBox.sizePolicy.hasHeightForWidth
    @componentsComboBox.sizePolicy = @sizePolicy1

    @horizontalLayout_4.addWidget(@componentsComboBox)

    @addAllToListButton = Qt::PushButton.new(@centralwidget)
    @addAllToListButton.objectName = "addAllToListButton"

    @horizontalLayout_4.addWidget(@addAllToListButton)


    @verticalLayout.addLayout(@horizontalLayout_4)

    @progressBar = Qt::ProgressBar.new(@centralwidget)
    @progressBar.objectName = "progressBar"
    @progressBar.value = 0

    @verticalLayout.addWidget(@progressBar)

    @infoLabel = Qt::Label.new(@centralwidget)
    @infoLabel.objectName = "infoLabel"
    @infoLabel.layoutDirection = Qt::LeftToRight
    @infoLabel.alignment = Qt::LeftToRight

    @verticalLayout.addWidget(@infoLabel)

    @componentsList = Qt::ListWidget.new(@centralwidget)
    @componentsList.objectName = "componentsList"

    @verticalLayout.addWidget(@componentsList)

    @horizontalLayout_8 = Qt::HBoxLayout.new()
    @horizontalLayout_8.objectName = "horizontalLayout_8"
    @removeSelectedButton = Qt::PushButton.new(@centralwidget)
    @removeSelectedButton.objectName = "removeSelectedButton"

    @horizontalLayout_8.addWidget(@removeSelectedButton)

    @removeAllButton = Qt::PushButton.new(@centralwidget)
    @removeAllButton.objectName = "removeAllButton"

    @horizontalLayout_8.addWidget(@removeAllButton)


    @verticalLayout.addLayout(@horizontalLayout_8)

    @horizontalLayout_5 = Qt::HBoxLayout.new()
    @horizontalLayout_5.objectName = "horizontalLayout_5"
    @isDateButton = Qt::RadioButton.new(@centralwidget)
    @isDateButton.objectName = "isDateButton"
    @sizePolicy3 = Qt::SizePolicy.new(Qt::SizePolicy::Maximum, Qt::SizePolicy::Fixed)
    @sizePolicy3.setHorizontalStretch(0)
    @sizePolicy3.setVerticalStretch(0)
    @sizePolicy3.heightForWidth = @isDateButton.sizePolicy.hasHeightForWidth
    @isDateButton.sizePolicy = @sizePolicy3

    @horizontalLayout_5.addWidget(@isDateButton)

    @label_4 = Qt::Label.new(@centralwidget)
    @label_4.objectName = "label_4"
    @sizePolicy4 = Qt::SizePolicy.new(Qt::SizePolicy::Maximum, Qt::SizePolicy::Preferred)
    @sizePolicy4.setHorizontalStretch(0)
    @sizePolicy4.setVerticalStretch(0)
    @sizePolicy4.heightForWidth = @label_4.sizePolicy.hasHeightForWidth
    @label_4.sizePolicy = @sizePolicy4

    @horizontalLayout_5.addWidget(@label_4)

    @dateFromEdit = Qt::DateEdit.new(@centralwidget)
    @dateFromEdit.objectName = "dateFromEdit"
    @sizePolicy5 = Qt::SizePolicy.new(Qt::SizePolicy::Fixed, Qt::SizePolicy::Fixed)
    @sizePolicy5.setHorizontalStretch(0)
    @sizePolicy5.setVerticalStretch(0)
    @sizePolicy5.heightForWidth = @dateFromEdit.sizePolicy.hasHeightForWidth
    @dateFromEdit.sizePolicy = @sizePolicy5

    @horizontalLayout_5.addWidget(@dateFromEdit)

    @label_5 = Qt::Label.new(@centralwidget)
    @label_5.objectName = "label_5"
    @sizePolicy4.heightForWidth = @label_5.sizePolicy.hasHeightForWidth
    @label_5.sizePolicy = @sizePolicy4

    @horizontalLayout_5.addWidget(@label_5)

    @dateToEdit = Qt::DateEdit.new(@centralwidget)
    @dateToEdit.objectName = "dateToEdit"
    @sizePolicy5.heightForWidth = @dateToEdit.sizePolicy.hasHeightForWidth
    @dateToEdit.sizePolicy = @sizePolicy5

    @horizontalLayout_5.addWidget(@dateToEdit)

    @horizontalLayout_6 = Qt::HBoxLayout.new()
    @horizontalLayout_6.objectName = "horizontalLayout_6"
    @label_6 = Qt::Label.new(@centralwidget)
    @label_6.objectName = "label_6"

    @horizontalLayout_6.addWidget(@label_6)

    @authorEdit = Qt::LineEdit.new(@centralwidget)
    @authorEdit.objectName = "authorEdit"

    @horizontalLayout_6.addWidget(@authorEdit)


    @horizontalLayout_5.addLayout(@horizontalLayout_6)


    @verticalLayout.addLayout(@horizontalLayout_5)

    @horizontalLayout_7 = Qt::HBoxLayout.new()
    @horizontalLayout_7.objectName = "horizontalLayout_7"
    @label_7 = Qt::Label.new(@centralwidget)
    @label_7.objectName = "label_7"

    @horizontalLayout_7.addWidget(@label_7)

    @phraseEdit = Qt::LineEdit.new(@centralwidget)
    @phraseEdit.objectName = "phraseEdit"

    @horizontalLayout_7.addWidget(@phraseEdit)


    @verticalLayout.addLayout(@horizontalLayout_7)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @exportButton = Qt::PushButton.new(@centralwidget)
    @exportButton.objectName = "exportButton"

    @horizontalLayout_3.addWidget(@exportButton)


    @verticalLayout.addLayout(@horizontalLayout_3)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 569, 20)
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
    mainWindow.windowTitle = Qt::Application.translate("MainWindow", "Bugzilla Downloader", nil, Qt::Application::UnicodeUTF8)
    @label.text = Qt::Application.translate("MainWindow", "Adres Bugzilli:", nil, Qt::Application::UnicodeUTF8)
    @bugzillaURLLineEdit.text = Qt::Application.translate("MainWindow", "https://bugzilla.mozilla.org/", nil, Qt::Application::UnicodeUTF8)
    @loadProductsButton.text = Qt::Application.translate("MainWindow", "Za\305\202aduj produkty", nil, Qt::Application::UnicodeUTF8)
    @label_2.text = Qt::Application.translate("MainWindow", "Wybierz projekt:", nil, Qt::Application::UnicodeUTF8)
    @addToListButton.text = Qt::Application.translate("MainWindow", "Dodaj do listy", nil, Qt::Application::UnicodeUTF8)
    @label_3.text = Qt::Application.translate("MainWindow", "Wybierz komponent:", nil, Qt::Application::UnicodeUTF8)
    @addAllToListButton.text = Qt::Application.translate("MainWindow", "Dodaj wszystkie", nil, Qt::Application::UnicodeUTF8)
    @infoLabel.text = Qt::Application.translate("MainWindow", "TextLabel", nil, Qt::Application::UnicodeUTF8)
    @removeSelectedButton.text = Qt::Application.translate("MainWindow", "Usu\305\204 zaznaczone", nil, Qt::Application::UnicodeUTF8)
    @removeAllButton.text = Qt::Application.translate("MainWindow", "Usu\305\204 wszystkie", nil, Qt::Application::UnicodeUTF8)
    @isDateButton.text = Qt::Application.translate("MainWindow", "Data", nil, Qt::Application::UnicodeUTF8)
    @label_4.text = Qt::Application.translate("MainWindow", "Od:", nil, Qt::Application::UnicodeUTF8)
    @label_5.text = Qt::Application.translate("MainWindow", "Do:", nil, Qt::Application::UnicodeUTF8)
    @label_6.text = Qt::Application.translate("MainWindow", "Autor:", nil, Qt::Application::UnicodeUTF8)
    @label_7.text = Qt::Application.translate("MainWindow", "Szukana Fraza:", nil, Qt::Application::UnicodeUTF8)
    @exportButton.text = Qt::Application.translate("MainWindow", "Eksportuj", nil, Qt::Application::UnicodeUTF8)
    end # retranslateUi

    def retranslate_ui(mainWindow)
        retranslateUi(mainWindow)
    end

end

module Ui
    class MainWindow < Ui_MainWindow
    end
end  # module Ui

