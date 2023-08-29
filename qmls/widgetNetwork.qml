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
        font.family: "Times New Roman"
    }

//    Timer{
//        id: reloadTimer
//        interval: 1000
//        repeat: true
//        running: true
//        triggeredOnStart: true
//        onTriggered: xmlModel.reload()
//    }

    XmlListModel {
        id: xmlModel
//        source: "file:///home/anil/Documents/Qml_demo/qmlUi_demo/ip_links.xml"
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
        radius: 5
        width: 200
        height: 250
        color: "white"

        ListView{
            id:list
            anchors.fill: parent
            anchors.margins: 5
            width: parent.width
            height: parent.height
            model: xmlModel
            delegate: interfaceDelegate
            clip: true
            highlight: Rectangle {
                color: "skyblue"
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
            leftMargin: 40
            topMargin: 20
        }

        font.pixelSize: 20
        color: "#FFFFFF"/*"white"*/
        text: qsTr(str_selected)
    }

    property string str_reader: ""
    Text {
        id: read_satus
        anchors{
            top: selected.bottom
            left: rec_list.right
            leftMargin: 40
            topMargin: 20
        }
        font.pixelSize: 20
        text: qsTr("Reader = " + str_reader)
        color: "white"
    }

    property bool isPressedHold: false

    function increase()
    {
        if(slider.value < 100)
            slider.value += 1
    }

    function decrease()
    {
        if(slider.value > 0)
            slider.value -= 1
    }

    RowLayout {

        id: misc_row
        height: 50
        width: parent.width / 3
        spacing:10
        anchors {
            left: rec_list.right
            top: read_satus.bottom
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

            background: Rectangle {
                implicitHeight: 50
                implicitWidth: 100
                radius: 3
                color: btn_count.down ? pressedColor : defaultColor
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: btn_count.down ? pressedColor : defaultColor
                    samples: 20
                }
            }
        }

        Text {
            id: count_id
            width: parent.width/4
            font.pixelSize: 20
            color: "white"
            text: slider.value
        }


        Button {
            id: btn_count2
            width: parent.width/4
            text:"count --"
            onClicked: decrease()

            background: Rectangle {
                implicitHeight: 50
                implicitWidth: 100
                radius: 3
                color: btn_count2.down ? pressedColor : defaultColor
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: btn_count2.down ? pressedColor : defaultColor
                    samples: 20
                }
            }
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

            background: Rectangle {
                implicitHeight: 50
                implicitWidth: 100
                radius: 3
                color: btn_count3.down ? pressedColor : defaultColor
                layer.enabled: true
                layer.effect: DropShadow {
                    transparentBorder: true
                    color: btn_count3.down ? pressedColor : defaultColor
                    samples: 20
                }
            }
        }
    }

    property color defaultColor: "#AFABF2"
    property color pressedColor: Qt.darker(defaultColor,1.5)


    Slider {
        id: slider
        anchors{
            top: misc_row.bottom
            left: rec_list.right
            leftMargin: 40
        }
        width: 500
        height: 50
        from: 0
        value: 0
        to: 100
        stepSize: 1
        snapMode: Slider.SnapOnRelease
        onValueChanged:
        {
            console.log("slider " + value)
        }
    }

    // custom  ProgressBar
    function set_progress(){
        if(value <= 50)
            value += 1
        if(value > 50)
            value = 0
    }

    property double maximum: 50
    property double value:   0
    property double minimum: 0

    Timer {
           id: pbTimer
           interval: 1000
           repeat: true
           running: true
           triggeredOnStart: true
           onTriggered: set_progress()
       }


    Rectangle {
        id: progress_bar_border
        anchors{
            top: rec_list.bottom
            left: parent.left
            leftMargin: 40
            topMargin: 20
        }
        width: 800;  height: 40

        border.width: 0.05 * height
        radius: 0.5 * height

        Rectangle {
            visible: value > minimum
            x: 0.1 * parent.height;  y: 0.1 * parent.height
            width: Math.max(height,
                            Math.min((value - minimum) / (maximum - minimum) * (parent.width - 0.2 * parent.height),
                                     parent.width - 0.2 * parent.height)) // clip
            height: 0.8 * parent.height
            color: 'blue'
            radius: parent.radius
        }
    }


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

        MouseArea {
            anchors.fill: parent
            onClicked: {
                main_loader.source = "qrc:/qmls/StackViewPage.qml"
            }
        }
    }

}
