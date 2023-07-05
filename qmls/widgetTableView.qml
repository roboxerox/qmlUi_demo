import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4

Item {
    id: table_view_page
    anchors.fill: parent

    ListModel {
          id: coachModel
          ListElement {
              emply_id: "1200"
              emply_dep: "R&D HW"
              emply_role: "Sr. Developer"
              check: true
          }
          ListElement {
              emply_id: "1210"
              emply_dep: "R&D HW"
              emply_role: "Manager"
              check: true
          }
          ListElement {
              emply_id: "1211"
              emply_dep: "R&D SW"
              emply_role: "Sr. Developer"
              check: false
          }
          ListElement {
              emply_id: "1212"
              emply_dep: "SALES"
              emply_role: "Sales Executive"
              check: true
          }
          ListElement {
              emply_id: "1213"
              emply_dep: "PRODUCTION"
              emply_role: "Production manager"
              check: false
          }
          ListElement {
              emply_id: "1220"
              emply_dep: "MANAGEMENT"
              emply_role: "HR"
              check: true
          }
    }


    TableView {
        id: table_view
        anchors.fill: parent
          TableViewColumn {
              role: "emply_id"
              title: "EMPLOYEE ID"
              width: 200
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
              role: "check"
              title: "STATUS"
              delegate: CheckBox {
                  checked: styleData.value
              }
          }
          model: coachModel

          itemDelegate: Item {
              id: item_
              Text {
                  anchors.verticalCenter: parent.verticalCenter
                  //                  color: styleData.color
                  elide: Text.ElideRight
                  text: styleData.value
                  font.pixelSize: 15
              }
          }

          onClicked: {
              console.log(coachModel.get(row).coach_id + ' ' + coachModel.get(row).coach_type)
//              item_.
          }
      }



    Image {
        id: img_back_tablewidget1
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
