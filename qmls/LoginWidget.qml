import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3

Rectangle {
    id: virtual_keyboard
    anchors.fill: parent
    color: "lightgrey"

    Rectangle {
        width: 300
        height: 250
        anchors.centerIn: parent
        radius: 5
        TabBar {
            id: bar
            width: parent.width
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
            }

            TabButton {
                text: qsTr("Sign In")
            }

            TabButton {
                text: qsTr("Sign Up")
            }
        }

        StackLayout{
            id: stack_layout
            anchors {
                top: bar.bottom
            }

            width: parent.width
            height: parent.height - bar.height
            currentIndex: bar.currentIndex

            Rectangle {
                id: signin_tab
                color: "darkgrey"
                Text {
                    id: u_name
                    anchors{
                        top: parent.top
                        left: parent.left
                        margins: 40
                    }
                    width: 100
                    text: qsTr("User ID :")
                }

                KeyboardInput {
                    id: user_name
                    label: 'User ID'
                    anchors{
                        top: parent.top
                        left: u_name.right
                        topMargin: 25
                        leftMargin: 35
                    }
                    width: 100
                    height: 25

                    onAccepted: console.log('u_name', text)
                }

                Text {
                    id: u_pass
                    anchors{
                        top: u_name.bottom
                        left: parent.left
                        topMargin: 35
                        leftMargin: 40
                    }
                    width: 100
                    text: qsTr("Password :")
                }

                KeyboardInput {
                    id: user_pass
                    label: 'Password'
                    password: true
                    anchors{
                        top: u_name.top
                        left: u_pass.right
                        topMargin: 45
                        leftMargin: 35
                    }
                    width: 100
                    height: 25

                    onAccepted: console.log('user_pass', text)
                }

                Button{
                    id:submit
                    anchors{
                        top: u_pass.bottom
                        left: parent.left
                        topMargin: 35
                        leftMargin: 100
                    }

                    text: "login"

                    background: Rectangle {
                        implicitHeight: 50
                        implicitWidth: 100
                        radius: 3
                        color: submit.down ? pressedColor : defaultColor
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            color: submit.down ? pressedColor : defaultColor
                            samples: 20
                        }
                    }

                    onClicked: {

                        if(check_login() > 0)
                            error_msg = "User ID or Password  Unmatched !!"
                        else
                            error_msg = "Successfully matched"

                        message_box.open()
                    }
                }
            }

            Rectangle {
                id: signup_tab
                color: "darkgrey"


                Text {
                    id: u_fname
                    anchors{
                        top: parent.top
                        left: parent.left
                        margins: 20
                    }
                    width: 100
                    text: qsTr("User ID :")
                }

                KeyboardInput {
                    id: user_fname
                    label: 'User ID'
                    anchors{
                        top: parent.top
                        left: u_fname.right
                        margins: 20
                    }
                    width: 150
                    height: 25

                    onAccepted: console.log('u_fname', text)
                }

                Text {
                    id: u_fpass
                    anchors{
                        top: u_fname.bottom
                        left: parent.left
                        topMargin: 20
                        leftMargin: 20
                    }
                    width: 100
                    text: qsTr("Password :")
                }

                KeyboardInput {
                    id: user_fpass
                    label: 'Password'
                    password: true
                    anchors{
                        top: u_fname.top
                        left: u_fpass.right
                        topMargin: 30
                        leftMargin: 20
                    }
                    width: 150
                    height: 25

                    onAccepted: console.log('user_pass', text)
                }

                Text {
                    id: u_role
                    anchors{
                        top: u_fpass.bottom
                        left: parent.left
                        topMargin: 20
                        leftMargin: 20
                    }
                    width: 100
                    text: qsTr("Role :")
                }

                ComboBox {
                    id: role_combobox
                    anchors{
                        top: u_fpass.bottom
                        left: u_role.left
                        topMargin: 18
                        leftMargin: 120
                    }

                    width: 150
                    height: 25
                    model: ["Operator","Supervisor","Admin" ]
                    currentIndex: 0
                    onCurrentIndexChanged:{
                        str_role = role_combobox.textAt(currentIndex)
                    }
                }

                Button{
                    id:btn_signup
                    anchors{
                        top: u_role.bottom
                        left: parent.left
                        topMargin: 35
                        leftMargin: 100
                    }

                    text: "Register"

                    background: Rectangle {
                        implicitHeight: 50
                        implicitWidth: 100
                        radius: 3
                        color: btn_signup.down ? pressedColor : defaultColor
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            color: btn_signup.down ? pressedColor : defaultColor
                            samples: 20
                        }
                    }

                    onClicked: {
                        console.log("USER ID: ",user_fname.text," ROLE:",role_combobox.textAt(role_combobox.currentIndex))
                    }
                }

            }
        }

        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            color: "blue"
            samples: 35
        }

    }

    MessageDialog{
        id: message_box
        title: "Login Status"
        text: error_msg
        icon: error_type > 0 ? StandardIcon.Critical : StandardIcon.Information
        standardButtons: StandardButton.Ok
        onAccepted: {
            close()
        }
    }

    property string str_role: ""
    property int error_type: 0
    property string error_msg: "Successfully matched"
    property color defaultColor: "#AF5BF0"
    property color pressedColor: Qt.darker(defaultColor,1.5)


    function check_login(){
        if(user_name.text != "admin" || user_pass.text != "admin123")
            error_type = 1
        else
            error_type = 0

        return error_type
    }



    Image {
        id: img_back_vKeyboard
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
