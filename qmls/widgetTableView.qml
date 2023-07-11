import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4

Rectangle {
    id: table_view_page
    anchors.fill: parent
    color: "transparent"

    ListModel {
        id: emplyModel
        ListElement {
            emply_id: "1200"
            emply_dep: "R&D h/w"
            emply_role: "Sr. Developer"
            emply_name: "Jack Miller"
            check: true
        }
        ListElement {
            emply_id: "1210"
            emply_dep: "R&D h/w"
            emply_role: "Manager"
            emply_name: "Alina jose"
            check: true
        }
        ListElement {
            emply_id: "1211"
            emply_dep: "R&D s/w"
            emply_role: "Sr. Developer"
            emply_name: "Mike J. Khan"
            check: false
        }
        ListElement {
            emply_id: "1212"
            emply_dep: "Sales"
            emply_role: "Sales Executive"
            emply_name: "Peter Will"
            check: true
        }
        ListElement {
            emply_id: "1213"
            emply_dep: "Production"
            emply_role: "Production manager"
            emply_name: "Rammsy Roger"
            check: false
        }
        ListElement {
            emply_id: "1220"
            emply_dep: "Managment"
            emply_role: "HR Executive"
            emply_name: "Lara Smith"
            check: true
        }
        ListElement {
            emply_id: "1110"
            emply_dep: "IT"
            emply_role: "Sr. IT Support"
            emply_name: "Billy Batsson"
            check: false
        }
    }



    TableView {
        id: table_view
        height: parent.height - 100
        width: parent.width

        TableViewColumn {
            role: "emply_id"
            title: "EMPLOYEE ID"
        }
        TableViewColumn {
            role: "emply_dep"
            title: "EMPLOYEE DEPARTMENT"
        }
        TableViewColumn {
            role: "emply_role"
            title: "EMPLOYEE ROLE"
        }
        TableViewColumn {
            role: "emply_name"
            title: "EMPLOYEE NAME"
        }
        TableViewColumn {
            role: "check"
            title: "STATUS"
            delegate: CheckBox {
                checked: styleData.value
            }
        }
        model: emplyModel

        itemDelegate: Item {
            id: item_
            Text {
                anchors.verticalCenter: parent.verticalCenter
                //                  color: styleData.color
                elide: Text.ElideRight
                text: styleData.value
                font.pixelSize: 15
                color: "purple"
            }
        }

        onClicked: {
            str_id = emplyModel.get(row).emply_id
            str_name = emplyModel.get(row).emply_name
        }
    }// TableView


    property string str_id: ""
    property string str_name: ""

    Text {
        id: selected_id
        anchors{
            top: table_view.bottom
            left: parent.left
        }
        font.pixelSize: 20
        height: 45
        color: "lightgrey"
        text: str_id
    }

    Text {
        id: selected_name
        anchors{
            top: table_view.bottom
            left: selected_id.right
        }
        font.pixelSize: 20
        height: 45
        color: "lightgrey"
        text: " => "+str_name
    }



    Image {
        id: img_back_tableView
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
