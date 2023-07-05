import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {

    id: server_arch
    anchors.fill: parent

    Image {
        id: server_img
        anchors.fill: parent
        source: "qrc:/images/Screenshot.png"
    }

//    Button {
//        id: btn_server_back
//        anchors {
//            right: parent.right
//            bottom: parent.bottom
//            margins: 10
//        }

//        width: 100
//        height: 100

//        style: ButtonStyle {

//            label: Image {
//                source: "qrc:/images/Back_txt.png"
//                fillMode: Image.PreserveAspectFit  // ensure it fits
//            }
//        }

//        text: "Back"

//        onClicked: main_loader.source = "qrc:/qmls/StackViewPage.qml"
//    }



    Image {
        id: img_back_server_arch
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
