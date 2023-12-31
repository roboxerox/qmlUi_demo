import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

Item {
    id: grid_layout2

    ListModel {
        id : list_model
        ListElement {
            name:"HueSaturation"
            page: "qrc:/qmls/hueSaturationPage.qml"
        }
        ListElement {
            name:"Colorize"
            page: "qrc:/qmls/colorizePage.qml"
        }
        ListElement {
            name:"Brightness"
            page: "qrc:/qmls/brightnessContrastPage.qml"
        }
        ListElement {
            name:"SQL"
            page: "qrc:/qmls/sqlExample.qml"
        }
        ListElement {
            name:"Login"
            page: "qrc:/qmls/loginWidget.qml"
        }
        ListElement {
            name:"Swipe View"
            page: "qrc:/qmls/SwipeviewWidget.qml"
        }
        ListElement {
            name:"Misc"
            page: "qrc:/qmls/miscellaneousPage.qml"
        }
        ListElement {
            name:"NA"
            page: "qrc:/qmls/NA.qml"
        }

    }

    GridView {
        id: gridview
        anchors.fill: parent
        model: list_model
        cellHeight: 240
        cellWidth: 240
        delegate: Rectangle {
            width: 200
            height: 200
            color: "white"
            radius: 10
            Rectangle{
                anchors.centerIn: parent
                width: 194
                height: 194
                color: "#D1C4E9"
                radius: 10
                Text {
                    color: "white"
                    text: name
                    anchors.centerIn: parent
                    font.pixelSize: 20
                    font.bold: true

                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        main_loader.source = page
                    }
                }
            }

            layer.enabled: true
            layer.effect: DropShadow {
                transparentBorder: true
                color: "blue"
                samples: 50
            }
        }
    }

    property color defaultColor: "#808080"
    property color pressedColor: Qt.darker(defaultColor,1.5)


    Image {
        id: img_next
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
                stack_view.push("qrc:/qmls/flipView.qml")

            }
        }
    }


    Image {
        id: img_back
        anchors {
            left: parent.left
            rightMargin: 10
            verticalCenter: img_next.verticalCenter
        }

        sourceSize.width: 250
        sourceSize.height: 100
        smooth: true
        antialiasing: true
        source: "qrc:/images/Back_txt.png"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                stack_view.push("qrc:/qmls/GridLay1.qml")
            }
        }
    }

//    Button {
//        id: btn_next
//        anchors {
//            right: parent.right
//            bottom: parent.bottom
//            margins: 20
//        }

//        Image {
//            id: next_btn_img
//            anchors.fill: parent
//            sourceSize.width: 100
//            sourceSize.height: 100
//            smooth: true
//            antialiasing: true
//            source: "qrc:/images/Next_txt.png"

//        }

//    }

//    Button {
//        id: btn_previous
//        anchors {
//            left: parent.left
//            rightMargin: 10
//            verticalCenter: btn_next.verticalCenter
//        }

//        Image {
//            id: prv_btn_img
//            anchors.fill: parent
//            sourceSize.width: 100
//            sourceSize.height: 100
//            smooth: true
//            antialiasing: true
//            source: "qrc:/images/Back_txt.png"
//        }

//        onClicked: stack_view.push("qrc:/qmls/GridLay1.qml")
//    }

}
