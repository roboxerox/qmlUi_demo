import QtQuick 2.0
import QtQuick.Controls 2.2

Item {

    anchors.fill: parent

    Text {
        id: port_id
        anchors {
            top: parent.top
            left: parent.left
            margins: 40
        }
        height: 40
        font.pixelSize: 40
        color: "blue"
        text: "Port ID:"
    }


    TextEdit {
        id: port_id_value
        anchors {
            top: parent.top
            left: port_id.right
            margins: 40
        }
        height: 40
        text: "8009"
        font.pointSize: 40
        color: "white"
    }



    Image {
        id: img_back_setting
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
