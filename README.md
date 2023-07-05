# qmlUi_demo

This demo is using qt-qml which has include examples of :
1. Button
2. Status Bar
3. Date Time
4. Stack view
5. Table view
6. List view
7. Layout (Grid/row/column)
8. Dialog box
9. Combo Box
10. Label Clickable
11. Image Hue & Saturation
12. Image gamma Adjustment
13. Image colorization
14. Image brightness & Contrast
15. Label with RectangularGlow
16. Chart View (pie/Bar/line/spline)
17. Tab view


## Dependencies install

		sudo apt update
		sudo apt install build-essential qt5-default qtdeclarative5-dev
  		sudo apt install qml-module-qtquick-dialog libqt5charts5-dev 
		
		
## Build

		git clone https://github.com/roboxerox/qmlUi_demo.git
		cd qmlUi_demo
		mkdir qbuild && cd qbuild
		qmake ..
		make
		
## Run

		./qmlUi_demo
