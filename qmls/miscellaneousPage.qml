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

        source: (f_name != "null" && f_name != "")?f_name:"qrc:/images/BG001.png"
    }



    Image {
        id: img_back_widget1
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
