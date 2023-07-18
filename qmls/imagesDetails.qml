import QtQuick 2.7
import QtQuick.Controls 2.2

Item {

    id: ec_arch
    anchors.fill: parent

    Image {
        id: mvb_img
        anchors{
            left: parent.left
            top: parent.top
        }

        height: 260
        width: 460
        smooth: true
        antialiasing: true
        source: "qrc:/images/MVB_TCN_001.png"
    }

    Image {
        id: blank1_img
        anchors{
            left: mvb_img.right
            top: parent.top
        }

        height: 260
        width: 460
        smooth: true
        antialiasing: true
        source: "qrc:/images/BG001.png"
    }

    Image {
        id: server_img
        anchors{
            left: mvb_img.right
            top: mvb_img.bottom
        }

        height: 260
        width: 460
        smooth: true
        antialiasing: true
        source: "qrc:/images/Screenshot.png"
    }


    Image {
        id: blank2_img
        anchors{
            left: parent.left
            top: mvb_img.bottom
        }

        height: 260
        width: 460
        smooth: true
        antialiasing: true
        source: "qrc:/images/BG001.png"

        // flip images
        transform:  Matrix4x4 {
            matrix: Qt.matrix4x4( -1, 0, 0, blank2_img.width, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
          }

        //////transform: Scale{ xScale: -1 }
    }


    Image {
        id: img_back_imgDetails
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
