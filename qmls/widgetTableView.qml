import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4
import QtQuick.XmlListModel 2.0


Item {
    id: table_view_page
    anchors.fill: parent

//    ListModel {
//        id: emplyModel
//        ListElement {
//            emply_id: "1200"
//            emply_dep: "R&D h/w"
//            emply_role: "Sr. Developer"
//            emply_name: "Jack Miller"
//            check: true
//        }
//        ListElement {
//            emply_id: "1210"
//            emply_dep: "R&D h/w"
//            emply_role: "Manager"
//            emply_name: "Alina jose"
//            check: true
//        }
//        ListElement {
//            emply_id: "1211"
//            emply_dep: "R&D s/w"
//            emply_role: "Sr. Developer"
//            emply_name: "Mike J. Khan"
//            check: false
//        }
//        ListElement {
//            emply_id: "1212"
//            emply_dep: "Sales"
//            emply_role: "Sales Executive"
//            emply_name: "Peter Will"
//            check: true
//        }
//        ListElement {
//            emply_id: "1213"
//            emply_dep: "Production"
//            emply_role: "Production manager"
//            emply_name: "Rammsy Roger"
//            check: false
//        }
//        ListElement {
//            emply_id: "1220"
//            emply_dep: "Managment"
//            emply_role: "HR Executive"
//            emply_name: "Lara Smith"
//            check: true
//        }
//        ListElement {
//            emply_id: "1110"
//            emply_dep: "IT"
//            emply_role: "Sr. IT Support"
//            emply_name: "Billy Batsson"
//            check: false
//        }
//    }

    XmlListModel {
        id: emplyModel
        source: "qrc:/employee_details.xml"
        query: "/details/emply"

        XmlRole { name: "emply_id"; query: "emply_id/string()" }
        XmlRole { name: "emply_dep"; query: "emply_dep/string()" }
        XmlRole { name: "emply_role"; query: "emply_role/string()" }
        XmlRole { name: "emply_name"; query: "emply_name/string()" }
        XmlRole { name: "check"; query: "check/string()" }

    }



    TableView {
        id: table_view
        height: parent.height - 100
        width: parent.width

        TableViewColumn {
            role: "emply_id"
            title: "EMPLOYEE ID"
            width: 120
        }
        TableViewColumn {
            role: "emply_dep"
            title: "EMPLOYEE DEPARTMENT"
            width: 200
        }
        TableViewColumn {
            role: "emply_role"
            title: "EMPLOYEE ROLE"
            width: 200
        }
        TableViewColumn {
            role: "emply_name"
            title: "EMPLOYEE NAME"
            width: 200
        }
        TableViewColumn {
            role: "check"
            title: "STATUS"
            delegate: CheckBox {
                checked: (styleData.value == 1) ? true: false

            }
        }
        model: emplyModel

        itemDelegate: Item {
            id: item_
            height: 30
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
        id: selected_details
        anchors{
            top: table_view.bottom
            left: parent.left
        }
        font.pixelSize: 20
        height: 45
        color: "lightgrey"
        text: str_id !=""? "You have selected " + str_name + " ( " + str_id + " ) ." : ""
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
