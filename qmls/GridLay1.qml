import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
//import QtQuick.Controls 1.4
//import QtQuick.Controls.Styles 1.4


Item {
    id:grid_layout1

    ListModel {
        id : list_model
        ListElement {
            name:"Networking"
            page: "qrc:/qmls/widgetNetwork.qml"
            img:"qrc:/images/neural.png"
        }
        ListElement {
            name:"image layout"
            page: "qrc:/qmls/imagesDetails.qml"
            img:"qrc:/images/picture.png"
        }
        ListElement {
            name:"File Edit"
            page: "qrc:/qmls/fileEdit.qml"
            img:"qrc:/images/pages.png"
        }
        ListElement {
            name:"Tab Widget"
            page: "qrc:/qmls/TabWidget1.qml"
            img:"qrc:/images/tabs.png"
        }
        ListElement {
            name:"Table Widget"
            page: "qrc:/qmls/widgetTableView.qml"
            img:"qrc:/images/table.png"
        }
        ListElement {
            name:"Video Player";
           page: "qrc:/qmls/widgetVideoPlayer.qml"
           img:"qrc:/images/video-player.png"
        }
        ListElement {
            name:"Rect Design"
            page: "qrc:/qmls/recDesign.qml"
            img:"qrc:/images/sketch.png"
        }
        ListElement {
            name:"Gamma Adjustment"
            page: "qrc:/qmls/gammaAdjustment.qml"
            img:"qrc:/images/image.png"
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

                Image {
                    id: backgroung_img
                    anchors.fill: parent
                    source: img
                }

                Text {
                    color: "white"
                    text: name
                    anchors.top: backgroung_img.bottom
                    anchors.topMargin: 4
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
        }
    }

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
                stack_view.push("qrc:/qmls/GridLay2.qml")
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
//                stack_view.push("qrc:/qmls/GridLay1.qml")
            }
        }
    }

}
