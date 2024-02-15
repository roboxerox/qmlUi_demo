import QtQuick 2.0
import QtQuick.Controls 2.2

Item {
    id:_settings
    anchors.fill: parent

    property bool isStarted: false
    property string str_Watch: "00:00:00"
    Rectangle{
        id: main_Text
        height: 45
        radius: 20
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: 10
            rightMargin: 10
        }
        color: "#183939"
        Text {
            id: port_id
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 10
            }
            height: 35
            font.pixelSize: 35
            color: "blue"
            text: "Port ID:"
        }


        TextEdit {
            id: port_id_value
            anchors {
                top: parent.top
                left: port_id.right
            }
            height: 35
            text: "8009"
            font.pointSize: 30
            color: "white"
        }

        Button {
            id:stop_watch
            width: 100
            height: 35
            anchors {
                top: parent.top
                right: parent.right
                rightMargin: 20
                topMargin: 5
            }
            text: isStarted?"Stop":"Start"
            onClicked:
            {
                if(!isStarted)
                {
                    hour = 0
                    minute = 0
                    second = 0
                    pbTimer.start()
                    isStarted = true
                }
                else
                {
                    isStarted = false
                    pbTimer.stop()
                }
            }
        }

        Text {
            id: sText
            width: 80
            anchors {
                top: parent.top
                right: stop_watch.left
                rightMargin: 20
                topMargin: 15
            }
            color: "white"
            text: qsTr(str_Watch)
        }
    }
    property int hour:0
    property int minute: 0
    property int second: 0
    property string s_hour: "00"
    property string s_min: "00"
    property string s_sec: "00"

    function set_counter(){

        if(minute == 59)
        {
            if(hour < 23)
                hour++
            else
                hour = 0
        }

        if(second == 59)
        {
            if(minute < 59)
                minute++
            else
                minute = 0
        }

        if(second < 59)
            second++
        else
            second = 0

        if(second < 10)
            s_sec = "0"+second
        else
            s_sec = second

        if(minute < 10)
            s_min = "0"+minute
        else
            s_min = minute

        if(hour < 10)
            s_hour = "0"+hour
        else
            s_hour = hour

        str_Watch = s_hour+":"+s_min+":"+s_sec
    }

    Timer {
           id: pbTimer
           interval: 1000
           repeat: true
           running: false
           triggeredOnStart: false
           onTriggered: set_counter()
       }

    Rectangle{
        id: main_cir
        anchors.centerIn: parent
        width: 350
        height: 280
        color: "#375D5F"
        radius: 10

        Rectangle{
            id: left_line1
            anchors{
                top: main_cir.top
                left: main_cir.left
                leftMargin: 50
                verticalCenter: parent.verticalCenter
            }
            width: 5
            color: "#909090"
        }
        Rectangle{
            id: left_line2
            anchors{
                top: main_cir.top
                left: left_line1.left
                leftMargin: 8
                verticalCenter: parent.verticalCenter
            }
            width: 5
            color: "#CED1CE"
        }

        Rectangle{
            id: bottom_line1
            anchors{
                bottom: main_cir.bottom
                left: main_cir.left
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 50
            }
            height: 5
            color: "#909090"
        }
        Rectangle{
            id: bottom_line2
            anchors{
                bottom: bottom_line1.bottom
                left: main_cir.left
                horizontalCenter: parent.horizontalCenter
                bottomMargin: 8
            }
            height: 5
            color: "#CED1CE"
        }
    }


    Image {
        id: img_back_setting
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
