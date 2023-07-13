import QtQuick 2.0

Item {
    id: pathView_widget

    ListModel {
        id : list_model
        ListElement {
            name:"HueSaturation"
            page: "qrc:/qmls/hueSaturationPage.qml"
            icon: "qrc:/images/keypad_1.png"
        }
        ListElement {
            name:"Colorize"
            page: "qrc:/qmls/colorizePage.qml"
            icon: "qrc:/images/keypad_2.png"
        }
        ListElement {
            name:"Brightness"
            page: "qrc:/qmls/brightnessContrastPage.qml"
            icon: "qrc:/images/keypad_3.png"
        }
        ListElement {
            name:"Pie & Line Chart"
            page: "qrc:/qmls/demoCharts1.qml"
            icon: "qrc:/images/keypad_4.png"
        }
        ListElement {
            name:"Bar & Spline Chart"
            page: "qrc:/qmls/demoCharts2.qml"
            icon: "qrc:/images/keypad_5.png"
        }
        ListElement {
            name:"Misc"
            page: "qrc:/qmls/miscellaneousPage.qml"
            icon: "qrc:/images/keypad_6.png"
        }
        ListElement {
            name:"WebCam"
            page: "qrc:/qmls/webCam.qml"
            icon: "qrc:/images/keypad_7.png"
        }
    }


    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Component {
            id: delegate
            Item {
                id: wrapper
                width: 80; height: 80
                scale: PathView.iconScale
                Image {
                    id: icon_button
                    y: 20; anchors.horizontalCenter: parent.horizontalCenter
                    sourceSize.height: 80
                    sourceSize.width: 80
                    source: icon
                    smooth: true
                }
                Text {
                    id: nameText
                    anchors { top: icon_button.bottom; horizontalCenter: parent.horizontalCenter }
                    text: name
                    font.pointSize: 12
                    color: wrapper.PathView.isCurrentItem ? "lightgreen" : "black"
                    font.bold: wrapper.PathView.isCurrentItem ? "true" : "false"
                    smooth: true
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: main_loader.source = page
                }
            }
        }

        PathView {
            id: view
            rotation: 0
            anchors.fill: parent
            //            pathItemCount: 3
//            anchors.bottomMargin: 150
//            anchors.topMargin: 50
//            anchors.leftMargin: 100
//            preferredHighlightBegin: 0.5                         //
//            preferredHighlightEnd: 0.5                           // That should center the current item
//            highlightRangeMode: PathView.StrictlyEnforceRange    //

            anchors.bottomMargin: 150
            anchors.topMargin: 100
            anchors.leftMargin: 300
//            highlight: delegate
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
            focus: true

            model: list_model
            delegate: delegate
            path: Path {
//                startX: 0; startY: view.height/2
//                PathAttribute { name: "iconScale"; value: 0.2 }
//                PathAttribute { name: "iconOpacity"; value: 10.2 }
//                PathAttribute { name: "iconOrder"; value: 0 }
//                PathLine {x: view.width / 2; y: view.height/2 }
//                PathAttribute { name: "iconScale"; value: 1.2 }
//                PathAttribute { name: "iconOpacity"; value: 1 }
//                PathAttribute { name: "iconOrder"; value: 8 }
//                PathLine {x: view.width; y: view.height/2 }


//                startX: 120; startY: 100
//                PathQuad { x: 120; y: 25; controlX: 260; controlY: 75 }
//                PathQuad { x: 120; y: 100; controlX: -20; controlY: 75 }

                startX: 10
                startY: 50
                PathAttribute { name: "iconScale"; value: 0.5 }
                PathQuad { x: 200; y: 150; controlX: 50; controlY: 200 }
                PathAttribute { name: "iconScale"; value: 1.0 }
                PathQuad { x: 390; y: 50; controlX: 350; controlY: 200 }
                PathAttribute { name: "iconScale"; value: 0.5 }
            }
        }
    }



    Image {
        id: img_next_flipView
        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: 20
        }

        sourceSize.width: 250
        sourceSize.height: 100
        smooth: true
        antialiasing: true
        source: "qrc:/images/Next_txt.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
//                console.info("image clicked!")
            }
        }
    }


    Image {
        id: img_back_flipView
        anchors {
            left: parent.left
            rightMargin: 10
            verticalCenter: img_next_flipView.verticalCenter
        }

        sourceSize.width: 250
        sourceSize.height: 100
        smooth: true
        antialiasing: true
        source: "qrc:/images/Back_txt.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                stack_view.push("qrc:/qmls/GridLay2.qml")
            }
        }
    }

}
