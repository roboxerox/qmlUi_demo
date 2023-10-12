import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3
import QtQuick.XmlListModel 2.0
import MyDatabase 1.0


Item {
    id: login_widget
    anchors.fill: parent


    XmlListModel {
        id: xmlModel
        source: "qrc:/UserDetails.xml"
        query: "/UserDetails/User"

        XmlRole { name: "user_id"; query: "user_id/string()" }
        XmlRole { name: "user_pass"; query: "user_pass/string()" }
        XmlRole { name: "user_role"; query: "user_role/string()" }

    }

    MyDatabase{
        id:obj_mydb
    }

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
                        user_pass.text = ""
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
                        str_role = role_combobox.textAt(role_combobox.currentIndex)
                        console.log("USER ID: ",user_fname.text," ROLE:",str_role)

                        if(createDB())
                        {
                            obj_mydb.map = {"login_id": user_fname.text, "login_pass": user_fpass.text, "login_role":str_role}
                            if(obj_mydb.m_InsertTable("login_auth"))
                            {
                                error_msg = "Successfully saved."
                                error_type = 0
                            }
                            else
                            {
                                error_msg = "Unable to save details."
                                error_type = 1
                            }
                            message_box.open()
                        }
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
        error_type = 1
        for(var index=0; index<xmlModel.rowCount();index++)
        {
            if(user_name.text === xmlModel.get(index).user_id && user_pass.text === xmlModel.get(index).user_pass)
            {
                error_type = 0
                break
            }

//            console.log(xmlModel.get(index).user_id , xmlModel.get(index).user_pass)
        }
        return error_type
    }


    function createDB(){
        var status = 0
        obj_mydb.map = {"login_id": "varchar(10) NOT NULL", "login_pass": "varchar(20) NOT NULL", "login_role":"varchar(15) NOT NULL"}
        if(obj_mydb.m_CreateTable("login_auth"))
        {
            console.log("CREATED.")
            status = 1
        }
        else
        {
            console.log("NOT CREATED")
            status = 0
        }
        return status
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
