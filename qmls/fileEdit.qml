import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Controls.Styles 1.4
import QtQuick.XmlListModel 2.0

import File_Check 1.0

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
                    msg_type = 1
                    message_box.open()
                }
            }
        }

    }

    property string str_msg: "Text is empty"
    property int msg_type: 0

    MessageDialog {
        id: message_box
        title: msg_type > 0 ? "Error" : "Successful"
        text: str_msg
        icon: msg_type > 0 ? StandardIcon.Warning : StandardIcon.Information
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

    FileCheck {
        id: obj_fileCheck
    }

    FileDialog {
        id: openFileDialog
        nameFilters: ["Text files (*.txt)", "xml files (*.xml)", "All files (*)"]
        onAccepted: textEdit.text = openFile(openFileDialog.fileUrl)
    }

    FileDialog {
        id: saveFileDialog
        selectExisting: false
        nameFilters: ["Text files (*.txt)", "xml files (*.xml)", "All files (*)"]
        onAccepted: {
            saveFile(saveFileDialog.fileUrl, textEdit.text)
            if(obj_fileCheck.sl_exist(saveFileDialog.fileUrl))
            {
                str_msg = "successful to save " +saveFileDialog.fileUrl
                msg_type = 0
                message_box.open()
                textEdit.clear()
            }
            else {
                str_msg = "Unable to save " +saveFileDialog.fileUrl
                msg_type = 1
                message_box.open()
            }
        }
    }

    Image {
        id: text_img
        anchors{
            top:btn_row.bottom
            left: parent.left
            topMargin: 20

        }
        sourceSize.width: 800
        sourceSize.height: 450
        smooth: true
        antialiasing: true
        source: "qrc:/images/BG001.png"

        // flip images
        transform:  Matrix4x4 {
            matrix: Qt.matrix4x4( -1, 0, 0, text_img.width, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1)
        }
    }


    ScrollView {
        id: scroll_view
        anchors.fill: text_img
        TextArea {
            id: textEdit
            color: "white"
            font.pixelSize: 15
            text:""
            wrapMode: Text.WordWrap
            padding: 0
        }
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
