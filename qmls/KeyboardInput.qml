import QtQuick 2.0
import QtQuick.Controls 2.2

Rectangle {
    id: root

    property string label:    'label'
    property bool   password: false
    property alias  text:     textInput.text
   
    signal accepted(string text);


    width: 500;  height: 50
    border.width: 0.05 * root.height
    radius:       0.2 * height
    opacity:      enabled  &&  !mouseArea.pressed? 1: 0.3
   
    Text {
        visible: !textInput.text
        text: label
        anchors {left: parent.left;  right: parent.right;  verticalCenter: parent.verticalCenter;  margins: parent.radius}
        font.pixelSize: 0.5 * parent.height    
        opacity: 0.3
    }

    TextInput {
        id: textInput
       
        anchors {left: parent.left;  right: parent.right;  verticalCenter: parent.verticalCenter;  margins: parent.radius}
        font.pixelSize: 0.5 * parent.height
        echoMode: password? TextInput.Password: TextInput.Normal
    }
   
    MouseArea {
        id: mouseArea
       
        anchors.fill: parent

        onClicked:  keyboardController.show()
    }
   
    KeyboardController {
        id: keyboardController

        password: root.password

        onAccepted: {
            textInput.text = text
            root.accepted(text)
        }
    }
}
