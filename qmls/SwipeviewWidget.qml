import QtQuick 2.0
import QtQuick.Controls 2.2
import QtCharts 2.2

Item {

    SwipeView{
        id: swipe_view

        currentIndex: 0
        anchors.fill: parent

        Item {
            id: firstPage
            Text {
                id: textName_1
                anchors{
                    top:parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Pie Chart")
                font.family: "Tibetan Machine Uni"
                font.pixelSize: 45
                color: "white"
            }

            ChartView {
                id: pie_chart
                anchors{
                    top:textName_1.bottom
                    left: parent.left
                    leftMargin: 10
                }
                title: "Working Hours"
                titleColor: "#7a092c"
                width: 920
                height: 380
                theme: ChartView.ChartThemeBrownSand
                antialiasing: true

                PieSeries {
                    name: "Office Hours"
                    id: pieSeries
                    PieSlice { label: "works"; value: 76 }
                    PieSlice { label: "lunch break"; value: 6.25 }
                    PieSlice { label: "tea breaks"; value: 6.25 }
                    PieSlice { label: "discussion"; value: 11.50 }

                }
            }

        }

        Item {
            id: secondPage
            Text {
                id: textName_2
                anchors{
                    top:parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Line Chart")
                font.family: "Tibetan Machine Uni"
                font.pixelSize: 45
                color: "white"
            }

            ChartView {
                id: line_chart
                title: "Line"
                anchors{
                    left: parent.left
                    top: textName_2.bottom
                    leftMargin: 20
                }
                theme: ChartView.ChartThemeBlueCerulean
                width: 920
                height: 380
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
        }
        Item {
            id: thirdPage
            Text {
                id: textName_3
                anchors{
                    top:parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Bar Chart")
                font.family: "Tibetan Machine Uni"
                font.pixelSize: 45
                color: "white"
            }

            ChartView {
                id: bar_chart
                anchors{
                    top:textName_3.bottom
                    left: parent.left
                    leftMargin: 20
                }
                theme: ChartView.ChartThemeBrownSand
                title: "Projects Inputs"
                width: 920
                height: 380
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
        }
        Item {
            id: forthPage
            Text {
                id: textName_4
                anchors{
                    top:parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Spline Chart")
                font.family: "Tibetan Machine Uni"
                font.pixelSize: 45
                color: "white"
            }

            ChartView {
                id: spline_chart
                title: "Poject Output"
                anchors{
                    left: parent.left
                    top: textName_4.bottom
                    leftMargin: 20
                }
                theme: ChartView.ChartThemeBlueIcy
                width: 920
                height: 380
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
        }
    }

    PageIndicator {
        id: indicator

        count: swipe_view.count
        currentIndex: swipe_view.currentIndex

        anchors.bottom: swipe_view.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }


    Image {
        id: img_back_swipe_view
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
