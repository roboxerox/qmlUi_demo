import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2
import MyDatabase 1.0
import QtQuick.Dialogs 1.2


Item {

    id: sql_1
    anchors.fill: parent

    MyDatabase {
        id: obj_mydb
    }

    Rectangle{
        anchors.centerIn: parent
        width: 350
        height: 280
        color: "grey"
        radius: 10
        Text {
            id: eId
            anchors{
                top: parent.top
                left: parent.left
                margins: 50
            }
            width: 100
            height: 50
            text: qsTr("Emply id")
            font.pixelSize: 15
            color: "white"
        }

        Rectangle{
            id: idRec
            anchors {
                top: parent.top
                left: eId.right
                margins: 46
            }
            border.color: "blue"
            radius: 5
            color: "white"
            width: 100
            height: 30
            TextInput {
                id: iTxt
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "00000A"
            }
        }

        Text {
            id: eName
            anchors{
                top: eId.bottom
                left: parent.left
                margins: 50
            }
            width: 100
            height: 50
            text: qsTr("Emply Name")
            font.pixelSize: 15
            color: "white"
        }

        Rectangle{
            id:nameRec
            anchors {
                top: eId.bottom
                left: eName.right
                margins: 46
            }
            border.color: "grey"
            radius: 5
            color: "white"
            width: 100
            height: 30
            TextInput {
                id: nameTxt
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                text: "SAMPLE"
            }
        }


        Button {
            id: btn1
            anchors{
                top: eName.bottom
                left: parent.left
                horizontalCenter: parent.horizontalCenter
            }
            height: 50
            text: "Insert Data"
            onClicked: {
                if(createDB())
                {
                    obj_mydb.map = {"emply_id": iTxt.text, "emply_name": nameTxt.text}

                    if(obj_mydb.m_InsertTable("emply_data"))
                    {
                        msg_type = 0
                        str_msg = "Inserted in Table Successfully ."
                    }
                    else
                    {
                        msg_type = 1
                        str_msg = "Unable to Insert in Table ."
                    }
                    msgdialog.open()
                }
                else
                    console.log("UNABLE TO OPEN DB")
            }
        }
    }

    function createDB(){
        var status = 0
        obj_mydb.map = {"emply_id": "varchar(10) NOT NULL", "emply_name": "varchar(20) NOT NULL"}
        if(obj_mydb.m_CreateTable("emply_data"))
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

    property int msg_type: 1
    property string str_msg: ""
    MessageDialog {
        id :msgdialog
        title: msg_type > 0 ? "Error" : "Successful"
        text: str_msg
        icon: msg_type > 0 ? StandardIcon.Warning : StandardIcon.Information
        standardButtons: StandardButton.Ok
        onAccepted: {
            close()
        }
    }


    ///// EXIT Button
    Image {
        id: img_back_demochart1
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
