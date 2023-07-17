import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2


Rectangle {

    id: demo_charts2
    anchors.fill: parent
    anchors.margins: 20
    color: "transparent"

    ChartView {
        id: chartView
        title: "Scatters"
        anchors.fill: parent
//        anchors{
//            top: parent.top
//            left: parent.left
//            margins: 10
//        }
        theme: ChartView.ChartThemeBlueCerulean
//        titleFont: Font{
//            bold: true
//            pixelSize: 25
//        }

        antialiasing: true

        ScatterSeries {
            id: scatter1
            name: "Scatter1"
            XYPoint { x: 1.5; y: 1.5 }
            XYPoint { x: 1.5; y: 1.6 }
            XYPoint { x: 1.57; y: 1.55 }
            XYPoint { x: 1.8; y: 1.8 }
            XYPoint { x: 1.9; y: 1.6 }
            XYPoint { x: 2.1; y: 1.3 }
            XYPoint { x: 2.5; y: 2.1 }
        }

        ScatterSeries {
            name: "Scatter2"
            XYPoint { x: 1.2; y: 2.1 }
            XYPoint { x: 2.0; y: 2.0 }
            XYPoint { x: 2.0; y: 2.1 }
            XYPoint { x: 2.07; y: 2.05 }
            XYPoint { x: 2.2; y: 2.9 }
            XYPoint { x: 2.4; y: 2.7 }
            XYPoint { x: 2.67; y: 2.65 }
        }

        PinchArea{
            id: pa
            anchors.fill: parent
            onPinchUpdated: {
                chartView.zoomReset();
                var center_x = pinch.center.x
                var center_y = pinch.center.y
                var width_zoom = height/pinch.scale;
                var height_zoom = width/pinch.scale;
                var r = Qt.rect(center_x-width_zoom/2, center_y - height_zoom/2, width_zoom, height_zoom)
                chartView.zoomIn(r)
            }

        }

    }


    ///// EXIT Button
    Image {
        id: img_back_demochart
        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: 20
        }

        sourceSize.width: 250
        sourceSize.height: 100
        smooth: true
        antialiasing: true
        source: "qrc:/images/Back_txt.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                main_loader.source = "qrc:/qmls/StackViewPage.qml"
            }
        }
    }


}
