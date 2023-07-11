import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Dialogs 1.2
import QtGraphicalEffects 1.0
import QtQuick.XmlListModel 2.0
import QtQuick.Layouts 1.3

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
        XmlRole { name: "mac_addr"; query: "mac_addr/string()" }

    }

    Component {
        id: interfaceDelegate
        Item {
            width: 200; height: 60
            Column {
                Text { text: '<b>eth Name:</b> ' + ifname }
                Text { text: '<b>IP Address:</b> ' + ip_addr }
                Text { text: '<b>MAC ID:</b> ' + mac_addr }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: list.currentIndex = index
            }
        }
    }

    property string str_selected: ""

    Rectangle{
        id: rec_list
        anchors {
            top: widget_name.bottom
            left: parent.left
            margins: 40
        }
        width: 200
        height: 250
        color: "white"

        ListView{
            id:list
            anchors.fill: parent
            width: parent.width
            height: parent.height
            model: xmlModel
            delegate: interfaceDelegate
            clip: true
            highlight: Rectangle {
                color: "lightsteelblue"
                radius: 5
            }
            ScrollBar.vertical: ScrollBar {
                snapMode: ScrollBar.SnapAlways
                policy: ScrollBar.AlwaysOn
            }
            focus: true
            onCurrentItemChanged: {
                str_selected = xmlModel.get(list.currentIndex).ifname + ' :: ' + xmlModel.get(list.currentIndex).ip_addr + ' :: ' + xmlModel.get(list.currentIndex).mac_addr
            }
        }
    }

    Text {
        id: selected
        anchors{
            left: rec_list.right
            top: rec_list.top
            margins: 40
        }

        font.pixelSize: 20
        color: "white"
        text: qsTr(str_selected)
    }

    property bool isPressedHold: false
    property int counter: 0  // integer . The default value is 0

    function increase()
    {
        if(counter < 100)
        {
            counter += 1
            slider.value = counter
        }
    }

    function decrease()
    {
        if(counter > 0)
        {
            counter -= 1
            slider.value = counter
        }
    }

    RowLayout{

        id: misc_row
        height: 50
        width: parent.width / 3
        spacing:5
        anchors {
            left: parent.left
            top: rec_list.bottom
            leftMargin: 40
            topMargin: 10
        }

        Button {
            id: btn_count
            width: parent.width/4
            text:"count ++"
            onClicked: increase()

            onPressAndHold: {
                isPressedHold = true
                console.log("pressed, isPressedHold="+isPressedHold)

            }
            onReleased: {
                isPressedHold = false
                console.log("relrease, isPressedHold="+isPressedHold)
            }
        }

        Text {
            id: count_id
            width: parent.width/4
            font.pixelSize: 20
            color: "white"
            text: counter
        }

        Button {
            id: btn_count2
            width: parent.width/4
            text:"count --"
            onClicked: decrease()
        }

        Button {
            id: btn_count3
            width: parent.width/4
            text:"Read"
            onClicked:
            {
                str_reader = reader.m_isReadable
                console.log("Reader Mode : " + str_reader)
                reader.m_isReadable = ! reader.m_isReadable
            }
        }
    }

    property string str_reader: ""
    Text {
        id: read_satus
        anchors{
            top: selected.bottom
            left: rec_list.right
            margins: 40
        }
        font.pixelSize: 20
        text: qsTr("Reader = " + str_reader)
        color: "white"
    }


    Slider {
        id: slider
        anchors{
            top: misc_row.bottom
            left: parent.left
            leftMargin: 40
        }
        width: 500
        height: 50
        from: 0
        value: 0
        to: 100
        snapMode: Slider.SnapOnRelease
        onValueChanged:
        {
//            console.log("slider " + value)
            counter = value
        }

    }





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
        id: img_back_network
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

//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                main_loader.source = "qrc:/qmls/StackViewPage.qml"
//            }
//        }
    }

}
