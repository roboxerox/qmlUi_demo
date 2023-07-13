import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.1




Rectangle {
    id: status_bar
    height: 50
    anchors {
        left: parent.left
        right: parent.right
        top: parent.top
    }
    color: "grey"

    RowLayout {
        id: button_row
        height: status_bar.height
        width: status_bar.width / 4
        spacing:5
        anchors {
            left: status_bar.left
            top: status_bar.top
            leftMargin: 5
        }

        Button {
            id:btn_home
            width: parent.width/3
            text: "Home"

            onClicked: main_loader.source = "qrc:/qmls/StackViewPage.qml"
        }

        Button {
            id:btn_setting
            width: parent.width/3
            text: "Settings"
            onClicked: {
                main_loader.source = "qrc:/qmls/Settings.qml"
            }
        }

        Button {
            id:btn_back
            width: parent.width/3
            text: "About"

            onClicked:
            {
//                var popupComponent = Qt.createComponent("qrc:/qmls/AboutDialog.qml")
//                var popup2 = popupComponent.createObject(parent);
//                popup2.open()
                about_box.open()
            }
        }

        Button {
            id:btn_close
            width: parent.width/3
            text: "Close"

            onClicked: Qt.quit()
        }
    }

    MessageDialog {
        id: about_box
        title: "About Us"
        text: "
               Qt/QML UI
               Version : 0.6
               Description: This is a demo example of qt/qml UI "
        icon: StandardIcon.Information
        standardButtons: StandardButton.Ok
        onAccepted: {
            close()
        }
    }



    function set()
    {
        status_datetime.text = Qt.formatDateTime(new Date(), "dddd MMMM dd yyyy  hh:mm:ss")
    }

    Text {
        id: status_datetime
        anchors {
            right: parent.right
            top: parent.top
            rightMargin: 10
        }
        height: parent.height
        width: parent.width / 4
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignRight
        color: "white"
        font.pixelSize: 20
    }


    Timer {
           id: dtTimer
           interval: 1000
           repeat: true
           running: true
           triggeredOnStart: true
           onTriggered: set()
       }

}
