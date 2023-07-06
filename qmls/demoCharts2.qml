import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2


Rectangle {

    id: demo_charts2
    anchors.fill: parent
    anchors.margins: 20
    color: "lightgrey"

    ChartView {
        id: bar_chart
        anchors{
            top:parent.top
            left: parent.left
            leftMargin: 10
        }
        title: "Bar view"
        width: 450
        height: 300
        legend.alignment: Qt.AlignBottom
        antialiasing: true

        BarSeries {
            name: "Inputs"
            id: mySeries
            axisX: BarCategoryAxis { categories: ["2019", "2020", "2021", "2022", "2023" ] }
            BarSet { label: "R&D(s/w)"; values: [2, 2, 3, 4, 5] }
            BarSet { label: "R&D(h/w)"; values: [5, 3, 2, 4, 6] }
            BarSet { label: "Sales"; values: [3, 5, 8, 9, 10] }
            BarSet { label: "Production"; values: [4, 2, 6, 8, 7] }
        }
    }

    ChartView {
        id: spline_chart
          title: "Spline View"
          anchors{
              left: bar_chart.right
              top: parent.top
          }
          width: 450
          height: 300
          antialiasing: true

          SplineSeries {
              name: "SplineSeries"
              XYPoint { x: 0; y: 0.0 }
              XYPoint { x: 1.1; y: 3.2 }
              XYPoint { x: 1.9; y: 2.4 }
              XYPoint { x: 2.1; y: 2.1 }
              XYPoint { x: 2.9; y: 2.6 }
              XYPoint { x: 3.4; y: 2.3 }
              XYPoint { x: 4.1; y: 3.1 }
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
