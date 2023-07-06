import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.XmlListModel 2.0

Rectangle {
    id: file_edit_page
    anchors.fill: parent
    color: "transparent"

    RowLayout{
        id: btn_row
        height: 30
        width: parent.width/4
        spacing:5
        anchors {
            left: parent.left
            top: parent.top
            leftMargin: 5
        }

        Button {
            id:btn_Open
            width: parent.width/3
            text: "Open"

            onClicked:{
                openFileDialog.open()
            }
        }

        Button {
            id:btn_Save
            width: parent.width/3
            text: "Save"

            onClicked:{
                if(textEdit.text != ""){
                    saveFileDialog.open()
                }
                else
                {
                    error_box.open()
                }
            }
        }

    }

    property string str_msg: "Text is empty"

    MessageDialog {
        id: error_box
        title: "Error"
        text: str_msg
        icon: StandardIcon.Information
        standardButtons: StandardButton.Ok
        onAccepted: {
            close()
        }
    }


    function openFile(fileUrl) {
        var request = new XMLHttpRequest();
        request.open("GET", fileUrl, false);
        request.send(null);
        return request.responseText;
    }

    function saveFile(fileUrl, text) {
        var request = new XMLHttpRequest();
        request.open("PUT", fileUrl, false);
        request.send(text);
        return request.status;
    }

    FileDialog {
        id: openFileDialog
        nameFilters: ["Text files (*.txt)", "All files (*)"]
        onAccepted: textEdit.text = openFile(openFileDialog.fileUrl)
    }

    FileDialog {
        id: saveFileDialog
        selectExisting: false
        nameFilters: ["Text files (*.txt)", "All files (*)"]
        onAccepted: {
            saveFile(saveFileDialog.fileUrl, textEdit.text)
            textEdit.clear()
        }
    }


    TextArea {
        id: textEdit
        anchors{
            top:btn_row.bottom
            left: parent.left
            topMargin: 10
        }
        color: "white"
        font.pixelSize: 20
        text:""
    }


    Image {
        id: img_back_file_edit
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
