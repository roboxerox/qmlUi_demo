import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0

Item {

    anchors.fill: parent

    Text {
        id: widget_name
        anchors {
            top: parent.top
            left: parent.left
            margins: 40
        }

        font.pixelSize: 40
        color: "white"
        text: qsTr("WIDGET NETWORKING")
    }


    XmlListModel {
        id: xmlModel
        source: "qrc:/ip_links.xml"
        query: "/eth/interface"

        XmlRole { name: "ifname"; query: "ifname/string()" }
        XmlRole { name: "ip_addr"; query: "ip_addr/string()" }
    }


    property string str_selected: ""

    Rectangle {
        id: rec_list
        anchors {
            top: widget_name.bottom
            left: parent.left
            margins: 40
        }

        width: 200; height: 250

        Component {
            id: interfaceDelegate
            Item {
                width: 200; height: 40
                Column {
                    Text { text: '<b>eth Name:</b> ' + ifname }
                    Text { text: '<b>IP Address:</b> ' + ip_addr }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: list.currentIndex = index
                }
            }
        }

        ListView {
            id:list
            anchors.fill: parent
            model: xmlModel
            delegate: interfaceDelegate
            highlight: Rectangle {
                color: "lightsteelblue"
                radius: 5
            }
            focus: true

            onCurrentItemChanged: {
                str_selected = xmlModel.get(list.currentIndex).ifname + ' : ' + xmlModel.get(list.currentIndex).ip_addr
            }
        }

        Text {
            id: selected
            anchors{
                left: list.right
                top: parent.top
                margins: 40
            }

            font.pixelSize: 20
            color: "white"
            text: qsTr(str_selected)
        }
    }



    property int counter: 0

    Button {
        id: btn_count
        anchors{
            left: parent.left
            top: rec_list.bottom
            margins: 20
        }
        text:"count ++"
        onClicked:
        {
            counter += 1
            slider.value = counter
        }
    }

    Text {
        id: count_id
        anchors {
            top: rec_list.bottom
            left: btn_count.right
            margins: 20
        }
        width: 50
        font.pixelSize: 20
        color: "white"
        text: counter
    }

    Button {
        id: btn_count2
        anchors{
            left: count_id.right
            top: rec_list.bottom
            margins: 20
        }
        text:"count --"
        onClicked:
        {
            if(counter > 0)
            {
                counter -= 1
                slider.value = counter
            }
        }
    }

    Button {
        id: btn_count3
        anchors{
            left: btn_count2.right
            top: rec_list.bottom
            margins: 20
        }
        text:"Read"
        onClicked:
        {
            console.log("Reader Mode : " + reader.m_isReadable)
            reader.m_isReadable = ! reader.m_isReadable
        }
    }



    Slider {
        id: slider
        anchors{
            top: btn_count.bottom
            left: parent.left
        }
        width: 500
        height: 50
        from: 1
        value: 1
        to: 100
        snapMode: Slider.SnapOnRelease
        onValueChanged:
        {
//            console.log("slider " + value)
            counter = value
        }

    }

//    LinearGradient {
//           anchors.fill: btn_count2
//           start: Qt.point(0, 0)
//           end: Qt.point(0, btn_count2.width)
//           gradient: Gradient {
//               GradientStop { position: 0.0; color: "white" }
//               GradientStop { position: 1.0; color: "black" }
//           }
//           Text {
//               id: name
//               text: qsTr("text")
//           }
//       }



//    // FileDialog
//    FileDialog {
//            id: exportDialog


//            title: "Please choose an XML TV file"
//            nameFilters: [("*.xml")]

//            onAccepted: {
//                fileio.parse(importDialog.fileUrl)
//            }
//            onRejected: {
//                console.log("Canceled")
//            }
//        } // end FileDialog


//    Button {
//        id: btn_back1
//        anchors {
//            right: parent.right
//            bottom: parent.bottom
//            margins: 20
//        }

//        text: "Back"

//        onClicked: main_loader.source = "qrc:/qmls/StackViewPage.qml"
//    }


    Image {
        id: img_back_widget1
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
