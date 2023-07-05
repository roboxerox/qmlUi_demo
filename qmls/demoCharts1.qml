import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2


Rectangle {

    id: demo_charts
    anchors.fill: parent
    anchors.margins: 20
    color: "lightgrey"

    ChartView {
        id: pie_chart
        anchors{
            top:parent.top
            left: parent.left
        }
        title: "pie "
        width: 450
        height: 300
        theme: ChartView.ChartThemeBrownSand
        antialiasing: true

        PieSeries {
            name: "Working Hours"
            id: pieSeries
            PieSlice { label: "works"; value: 76 }
            PieSlice { label: "Lunch break"; value: 6.25 }
            PieSlice { label: "tea breaks"; value: 6.25 }
            PieSlice { label: "discussion"; value: 11.50 }

        }
    }

    ChartView {
        id: line_chart
        title: "Line"
        anchors{
            left: pie_chart.right
            top: parent.top
        }
        width: 450
        height: 300
        antialiasing: true

        LineSeries {
            name: "LineSeries"
            XYPoint { x: 0; y: 0 }
            XYPoint { x: 1.1; y: 2.1 }
            XYPoint { x: 1.9; y: 3.3 }
            XYPoint { x: 2.1; y: 2.1 }
            XYPoint { x: 2.9; y: 4.9 }
            XYPoint { x: 3.4; y: 3.0 }
            XYPoint { x: 4.1; y: 3.3 }
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
