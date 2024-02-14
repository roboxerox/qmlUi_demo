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
                title: "Shares"
                anchors{
                    left: parent.left
                    top: textName_2.bottom
                    leftMargin: 20
                }
                theme: ChartView.ChartThemeBlueCerulean
                width: 920
                height: 380
                antialiasing: true

                ValueAxis {
                    id: valueAxis_year
                    min: 2000
                    max: 2024
                    minorTickCount: 1
                    tickCount: 12
                    labelFormat: "%.0f"
                }

                ValueAxis {
                    id: valueAxis_Price
                    min: 5
                    max: 600
                    minorTickCount: 1
                    tickCount: 9
                    labelFormat: "%.0f"
                }

                LineSeries {
                    name: "XYZ Techno"
                    color: "lightgreen"
                    axisX: valueAxis_year
                    axisY: valueAxis_Price
                    width: 2
                    XYPoint { x: 2000; y: 5 }
                    XYPoint { x: 2005; y: 10 }
                    XYPoint { x: 2010; y: 150 }
                    XYPoint { x: 2015; y: 140 }
                    XYPoint { x: 2020; y: 210 }
                    XYPoint { x: 2021; y: 180 }
                    XYPoint { x: 2023; y: 320 }
                }

                LineSeries {
                    name: "ABC Finance"
                    color: "skyblue"
                    axisX: valueAxis_year
                    axisY: valueAxis_Price
                    width: 2
                    XYPoint { x: 2000; y: 15 }
                    XYPoint { x: 2005; y: 100 }
                    XYPoint { x: 2010; y: 210 }
                    XYPoint { x: 2015; y: 360 }
                    XYPoint { x: 2020; y: 200 }
                    XYPoint { x: 2021; y: 190 }
                    XYPoint { x: 2023; y: 560 }
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

        Item{
            id: fifthPage
            Text {
                id: textName_5
                anchors{
                    top:parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("AreaSeries Chart")
                font.family: "Tibetan Machine Uni"
                font.pixelSize: 45
                color: "white"
            }

            ChartView {
                id: chartView1
                title: "NHL All-Star Team Players"
                anchors{
                    left: parent.left
                    top: textName_5.bottom
                    leftMargin: 20
                }
                theme: ChartView.ChartThemeBrownSand
                width: 920
                height: 380
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
                    name: "Australian"
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
        }

        Item {
            id: sixthPage
            Text {
                id: textName_6
                anchors{
                    top:parent.top
                    horizontalCenter: parent.horizontalCenter
                }
                text: qsTr("Scatter Chart")
                font.family: "Tibetan Machine Uni"
                font.pixelSize: 45
                color: "white"
            }

            ChartView {
                id: chartView2
                title: "RADAR Map"
                anchors{
                    left: parent.left
                    top: textName_6.bottom
                    leftMargin: 20
                }
                theme: ChartView.ChartThemeBlueCerulean
                width: 920
                height: 380
                antialiasing: true

                ValueAxis {
                    id: valueAxis_height
                    min: 0.0
                    max: 3.0
                    minorTickCount: 4
                    tickCount: 4
                    labelFormat: "%.0f"
                }
                ValueAxis {
                    id: valueAxis_diameter
                    min: 0.0
                    max: 3.0
                    minorTickCount: 1
                    tickCount: 4
                    labelFormat: "%.0f"
                }

                ScatterSeries {
                    id: scatter1
                    name: "Radar-SW56"
                    color: "red"
                    axisX: valueAxis_height
                    axisY: valueAxis_diameter
                    XYPoint { x: 0.5; y: 1.0 }
                    XYPoint { x: 1.5; y: 1.9 }
                    XYPoint { x: 1.57; y: 1.55 }
                    XYPoint { x: 1.8; y: 1.8 }
                    XYPoint { x: 1.9; y: 1.6 }
                    XYPoint { x: 2.1; y: 1.3 }
                    XYPoint { x: 2.5; y: 2.4 }
                }

                ScatterSeries {
                    id: scatter2
                    name: "Radar-NE08"
                    color: "blue"
                    axisX: valueAxis_height
                    axisY: valueAxis_diameter
                    XYPoint { x: 1.2; y: 1.9 }
                    XYPoint { x: 2.0; y: 2.0 }
                    XYPoint { x: 1.0; y: 2.0 }
                    XYPoint { x: 2.07; y: 2.05 }
                    XYPoint { x: 2.2; y: 2.0 }
                    XYPoint { x: 1.9; y: 1.9 }
                    XYPoint { x: 2.05; y: 2.15 }
                }

                ScatterSeries {
                    id: scatter3
                    name: "Radar-W004"
                    color: "green"
                    axisX: valueAxis_height
                    axisY: valueAxis_diameter
                    XYPoint { x: 0.8; y: 1.4 }
                    XYPoint { x: 1.0; y: 1.08 }
                    XYPoint { x: 1.8; y: 1.02 }
                    XYPoint { x: 1.07; y: 1.5 }
                    XYPoint { x: 2.01; y: 1.1 }
                    XYPoint { x: 1.5; y: 2.2 }
                    XYPoint { x: 2.3; y: 1.92 }
                }

        //        PinchArea{
        //            id: pa
        //            anchors.fill: parent
        //            onPinchUpdated: {
        //                chartView.zoomReset();
        //                var center_x = pinch.center.x
        //                var center_y = pinch.center.y
        //                var width_zoom = height/pinch.scale;
        //                var height_zoom = width/pinch.scale;
        //                var r = Qt.rect(center_x-width_zoom/2, center_y - height_zoom/2, width_zoom, height_zoom)
        //                chartView.zoomIn(r)
        //            }
        //        }

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
