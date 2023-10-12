import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 1024
    height: 680
    title: qsTr("Qt/QML UI")
    flags: Qt.FramelessWindowHint

    Image {
        id: backgroung_img
        anchors.fill: parent
        source: "qrc:/images/BG001.png"
    }

    StatusBar {
        id: statusbar
    }

    Loader {
        id: main_loader
        anchors {
            left: parent.left
            right: parent.right
            top: statusbar.bottom
            bottom: parent.bottom
            margins: 30
        }

        source: "qrc:/qmls/StackViewPage.qml"
    }

    BottomBar{
        id: bottombar
    }
}
