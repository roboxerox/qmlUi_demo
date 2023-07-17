import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2


Rectangle {

    id: demo_charts
    anchors.fill: parent
    anchors.margins: 20
    color: "transparent"

    ChartView {
        title: "NHL All-Star Team Players"
        anchors{
            top: parent.top
            left: parent.left
            margins: 10
        }
        theme: ChartView.ChartThemeBrownSand
        width: 920
        height: 400
        antialiasing: true

        // Define x-axis to be used with the series instead of default one
        ValueAxis {
            id: valueAxis
            min: 2010
            max: 2021
            tickCount: 12
            labelFormat: "%.0f"
        }

        AreaSeries {
            name: "Russian"
            color: "#FFA52C1E"
            borderColor: "#FF0039A5"
            borderWidth: 3
            axisX: valueAxis
            upperSeries: LineSeries {
                XYPoint { x: 2010; y: 1 }
                XYPoint { x: 2011; y: 2 }
                XYPoint { x: 2012; y: 1 }
                XYPoint { x: 2013; y: 1 }
                XYPoint { x: 2014; y: 1 }
                XYPoint { x: 2015; y: 0 }
                XYPoint { x: 2016; y: 1 }
                XYPoint { x: 2017; y: 1 }
                XYPoint { x: 2018; y: 4 }
                XYPoint { x: 2019; y: 3 }
                XYPoint { x: 2020; y: 2 }
                XYPoint { x: 2021; y: 1 }
            }
        }

        AreaSeries {
            name: "India"
            color: "#FFA51E"
            borderColor: "green"
            borderWidth: 3
            axisX: valueAxis
            upperSeries: LineSeries {
                XYPoint { x: 2010; y: 0 }
                XYPoint { x: 2011; y: 0 }
                XYPoint { x: 2012; y: 1 }
                XYPoint { x: 2013; y: 1 }
                XYPoint { x: 2014; y: 3 }
                XYPoint { x: 2015; y: 1 }
                XYPoint { x: 2016; y: 2 }
                XYPoint { x: 2017; y: 1 }
                XYPoint { x: 2018; y: 3 }
                XYPoint { x: 2019; y: 3 }
                XYPoint { x: 2020; y: 1 }
                XYPoint { x: 2021; y: 3 }
            }
        }
    }


    ///// EXIT Button
    Image {
        id: img_back_demochart1
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
