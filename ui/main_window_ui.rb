=begin
** Form generated from reading ui file 'main_window.ui'
**
** Created: niedz. pa 12 02:00:59 2014
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
    attr_reader :horizontalLayout_3
    attr_reader :exportButton
    attr_reader :menubar
    attr_reader :statusbar

    def setupUi(mainWindow)
    if mainWindow.objectName.nil?
        mainWindow.objectName = "mainWindow"
    end
    mainWindow.resize(552, 133)
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

    @horizontalLayout_2.addWidget(@productsComboBox)


    @verticalLayout.addLayout(@horizontalLayout_2)

    @horizontalLayout_3 = Qt::HBoxLayout.new()
    @horizontalLayout_3.objectName = "horizontalLayout_3"
    @exportButton = Qt::PushButton.new(@centralwidget)
    @exportButton.objectName = "exportButton"

    @horizontalLayout_3.addWidget(@exportButton)


    @verticalLayout.addLayout(@horizontalLayout_3)

    mainWindow.centralWidget = @centralwidget
    @menubar = Qt::MenuBar.new(mainWindow)
    @menubar.objectName = "menubar"
    @menubar.geometry = Qt::Rect.new(0, 0, 552, 21)
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

