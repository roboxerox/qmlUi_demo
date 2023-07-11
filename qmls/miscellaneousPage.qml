import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2

Rectangle {
    id: miscellaneous_page
    anchors.fill: parent
    color: "transparent"

    property string f_name: "null"
    Button {
        id: btn_file_name
        x: 20
        y: 16
        text: "Select"

       onClicked: {
           fileDialog.open()
       }
    }


    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        nameFilters: [ "Image files (*.jpg *.png)"]
        onAccepted: {
            f_name = fileDialog.fileUrl
            console.log("You chose: " + f_name)
            close()
        }
        onRejected: {
            console.log("Canceled")
            close()
        }
//        Component.onCompleted: visible = true
    }

    Image {
        id: label_pix
        anchors{
            left: btn_file_name.right
            margins: 25
        }

        sourceSize.width: 720
        sourceSize.height: 480
        smooth: true
        antialiasing: true

        SequentialAnimation on y {
            loops: Animation.Infinite
            NumberAnimation { to: 450 - label_pix.height; easing.type: Easing.OutBounce; duration: 2000 }
            PauseAnimation { duration: 1000 }
            NumberAnimation { to: 120; easing.type: Easing.OutQuad; duration: 1000 }
        }

        source: (f_name != "null" && f_name != "")?f_name:"qrc:/images/qml-ui-demo-logo.png"
    }


    Image {
        id: img_back_misc
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
