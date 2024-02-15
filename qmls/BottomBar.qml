import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3


Rectangle {
    id: bottom_bar
    height: 50
    color: "#6f5555"
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }

    RowLayout{
        id: row_layout
        height: bottom_bar.height
        width: bottom_bar.width
        spacing:15
        anchors {
            left: bottom_bar.left
            top: bottom_bar.top
            leftMargin: 10
            rightMargin: 10
        }

        Image {
            id: img_apps

            sourceSize.width: 35
            sourceSize.height: parent.height
            smooth: true
            antialiasing: true
            source: "qrc:/images/list.png"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    //main_loader.source = "qrc:/qmls/StackViewPage.qml"
                    console.log("LIST clicked")
                }
            }
        }

//        Image {
//            id: img_home
//            anchors.centerIn: parent
//            sourceSize.width: 35
//            sourceSize.height: parent.height
//            smooth: true
//            antialiasing: true
//            source: "qrc:/images/home.png"

////            MouseArea {
////                anchors.fill: parent
////                onClicked: {
////                    main_loader.source = "qrc:/qmls/StackViewPage.qml"
////                }
////            }
//        }

        Button{
            id: btn_home
            width: 35
            height: 35
            anchors.centerIn: parent
            Image {
                anchors.fill: parent
                source: "qrc:/images/home.png"
//                fillMode: Image.Tile
                sourceSize.width: parent.width
                sourceSize.height: parent.height
                smooth: true
//                antialiasing: true
            }
            flat: true
            onClicked: {
                console.log("HOME clicked")
            }
        }

        Image {
            id: img_back
            anchors{
                right: parent.right
                rightMargin: 20
            }
            sourceSize.width: 40
            sourceSize.height: parent.height
            smooth: true
            antialiasing: true
            source: "qrc:/images/return.png"

            MouseArea {
                id:ma_back
                anchors.fill: parent
                onClicked: {
                    main_loader.source = "qrc:/qmls/StackViewPage.qml"
                    console.log("return")
                }
            }
        }
    }
}
