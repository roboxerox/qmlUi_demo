# qmlUi_demo

This demo is using qt-qml which has include examples of :

* [Button](https://doc.qt.io/qt-6/qml-qtquick-controls-button.html)
* Status Bar
* Date Time using [Timer](https://doc.qt.io/qt-6/qml-qtqml-timer.html)
* [Stack view](https://doc.qt.io/qt-6/qml-qtquick-controls-stackview.html)
* Table view using [TableView](https://doc.qt.io/qt-6/qml-qtquick-tableview.html)
* List view using [ListModel](https://doc.qt.io/qt-6/qml-qtqml-models-listmodel.html)
* Tab view using [TabBar](https://doc.qt.io/qt-6/qml-qtquick-controls-tabbar.html) & [TabButton](https://doc.qt.io/qt-6/qml-qtquick-controls-tabbutton.html)
* Layout (Grid/row/column) using [GridView](https://doc.qt.io/qt-6/qml-qtquick-gridview.html) , [RowLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-rowlayout.html) & [ColumnLayout](https://doc.qt.io/qt-6/qml-qtquick-layouts-columnlayout.html)
* Dialog box using [QMessageBox](https://doc.qt.io/qt-6/qmessagebox.html) & [QFileDialog](https://doc.qt.io/qt-6/qfiledialog.html)
* [Combo Box](https://doc.qt.io/qt-6/qml-qtquick-controls-combobox.html)
* Label Clickable using [MouseArea](https://doc.qt.io/qt-6/qml-qtquick-mousearea.html)
* Image Hue & Saturation with [HueSaturation](https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-huesaturation.html)
* Image [gamma Adjustment](https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-gammaadjust.html)
* Image colorization using [Colorize](https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-colorize.html)
* Image brightness & Contrast using [BrightnessContrast](https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-brightnesscontrast.html)
* Label with [RectangularGlow](https://doc.qt.io/qt-6/qml-qt5compat-graphicaleffects-rectangularglow.html)
* Chart View (pie/Bar/line series/spline series/Area Series/Scatters)
* XML Read and create list view using [XmlListModel](https://doc.qt.io/qt-6/qml-qtqml-xmllistmodel-xmllistmodel.html)
* Read and Write in text file using [XMLHttpRequest](https://doc.qt.io/qt-6/qml-qtqml-xmlhttprequest.html)
* Virtual Keyboard with sign in & sign up function
* Progress Bar(Horizontal and Circular) & [Slider](https://doc.qt.io/qt-6/qml-qtquick-controls-slider.html)
* function and cpp class access in qml sheets
* Swipe view using [SwipeView](https://doc.qt.io/qt-6/qml-qtquick-controls-swipeview.html)
* Flip View using [PathView](https://doc.qt.io/qt-6/qml-qtquick-pathview.html)

## Dependencies install

		sudo apt update
		sudo apt install build-essential qt5-default qtdeclarative5-dev libqt5charts5-dev
		sudo apt install qml-module-qtquick-dialog  qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel qml-module-qtcharts qml-module-qtquick-xmllistmodel 
		

		
## cmake Build

		git clone https://github.com/roboxerox/qmlUi_demo.git
		cd qmlUi_demo
		mkdir cbuild && cd cbuild
		cmake ..
		make

## qmake Build

		git clone https://github.com/roboxerox/qmlUi_demo.git
		cd qmlUi_demo
		mkdir qbuild && cd qbuild
		qmake ..
		make
		
## Run
		cd <PATH_TO_BUILD>
		./qmlUi_demo
