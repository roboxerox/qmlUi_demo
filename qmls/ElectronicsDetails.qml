import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {

    id: ec_arch
    anchors.fill: parent

    Image {
        id: server_img
        anchors.fill: parent
        source: "qrc:/images/MVB_TCN_001.png"
    }

    Image {
        id: img_back_ec
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
