import QtQuick 2.0
import QtQuick.Dialogs 1.1




MessageDialog {
    id: about_box
    title: "About Us"
    text: "
           Stack UI
           Version : 0.1
           Description: This is a demo example of stack widgets in qt/qml"
    icon: StandardIcon.Information
    standardButtons: StandardButton.Ok
    onAccepted: {
        close()
    }
}
