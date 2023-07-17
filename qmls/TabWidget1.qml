import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Rectangle {
    id: widget2
    anchors.fill: parent

    TabBar{
        id: bar
        width: parent.width
        anchors{
            top: parent.top
            left: parent.left
            right: parent.right
        }

        TabButton {
            text: qsTr("One")
        }

        TabButton {
            text: qsTr("Two")
        }

        TabButton {
            text: qsTr("Three")
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

       Rectangle{
           id: tab_one
           color: "#A1149C"

           Text {
               id: one_tab_text
               text: qsTr("ONE'S WIDGET")
               font.family: "Tibetan Machine Uni"
               style: Text.Outline
               anchors.centerIn: parent
               color: "transparent"
               font.pixelSize: 40
           }
       }

       Rectangle{
           id: tab_two
           color: "#191F9F"

           Text {
               id: two_tab_text
               text: qsTr("TWO'S WIDGET")
               font.family: "Tibetan Machine Uni"
               anchors.centerIn: parent
               color: "white"
               font.pixelSize: 40
           }
       }

       Rectangle {
           id: tab_three
           color: "#067788"

           Text {
               id: three_tab_text
               text: qsTr("THREE'S WIDGET")
               font.family: "Tibetan Machine Uni"
               anchors.centerIn: parent
               color: "white"
               font.pixelSize: 40
           }
       }
   }



   Image {
       id: img_back_tabwidget1
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
