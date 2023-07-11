# qmlUi_demo

This demo is using qt-qml which has include examples of :

* Button
* Status Bar
* Date Time
* Stack view
* Table view
* List view
* Layout (Grid/row/column)
* Dialog box
* Combo Box
* Label Clickable
* Image Hue & Saturation
* Image gamma Adjustment
* Image colorization
* Image brightness & Contrast
* Label with RectangularGlow
* Chart View (pie/Bar/line/spline)
* Tab view
* XML Read and create list view
* Read and Write in text file
* File dialog to select file

## Dependencies install

		sudo apt update
		sudo apt install build-essential qt5-default qtdeclarative5-dev
		sudo apt install qml-module-qtquick-dialog libqt5charts5-dev 
		
		
## Build

		git clone https://github.com/roboxerox/qmlUi_demo.git
		cd qmlUi_demo
		mkdir q_build && cd q_build
		qmake ..
		make
		
## Run

		./qmlUi_demo
