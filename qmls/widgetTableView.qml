import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls 1.4

Item {
    id: table_view_page
    anchors.fill: parent

    ListModel {
          id: coachModel
          ListElement {
              coach_id: "80001A"
              coach_postion: "1"
              coach_type: "DTC"
              check: true
          }
          ListElement {
              coach_id: "80001B"
              coach_postion: "2"
              coach_type: "NDTC"
              check: true
          }
          ListElement {
              coach_id: "80002A"
              coach_postion: "3"
              coach_type: "NDTC"
              check: false
          }
          ListElement {
              coach_id: "70001A"
              coach_postion: "4"
              coach_type: "NDTC"
              check: true
          }
          ListElement {
              coach_id: "70001B"
              coach_postion: "5"
              coach_type: "NDTC"
              check: false
          }
          ListElement {
              coach_id: "70001C"
              coach_postion: "6"
              coach_type: "DTC"
              check: true
          }
    }


    TableView {
        id: table_view
        anchors.fill: parent
          TableViewColumn {
              role: "coach_postion"
              title: "COACH POSITION"
              width: 200
          }
          TableViewColumn {
              role: "coach_id"
              title: "COACH ID"
              width: 200
          }
          TableViewColumn {
              role: "coach_type"
              title: "COACH TYPE"
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
