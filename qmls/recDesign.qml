import QtQuick 2.0

import QtGraphicalEffects 1.0

Rectangle
{
    id:rect_design_page
    anchors.fill: parent
    color: "black"
    Item {
        id:rect1_design
        anchors{
            margins: 15
        }

        width: 300
        height: 300

        Rectangle {
            id: background
            anchors.fill: parent
            color: "black"
        }

        RectangularGlow {
            id: effect
            anchors.fill: rect
            glowRadius: 20
            spread: 0.2
            color: "white"
            cornerRadius: rect.radius + glowRadius
        }

        Rectangle {
            id: rect
            color: "black"
            anchors.centerIn: parent
            width: Math.round(parent.width / 1.5)
            height: Math.round(parent.height / 2)
            radius: 25

            MouseArea{
                anchors.fill: parent
                onClicked: console.log("rect1")
            }
        }
    }

    Item {
        id:rect2_design
        anchors{
            left: rect1_design.right
            margins: 15
        }

        width: 300
        height: 300

        Rectangle {
            id: backgroun2
            anchors.fill: parent
            color: "black"
        }

        RectangularGlow {
            id: effect2
            anchors.fill: rect2
            glowRadius: 20
            spread: 0.2
            color: "#55ff55"
            cornerRadius: rect2.radius + glowRadius
        }

        Rectangle {
            id: rect2
            color: "black"
            anchors.centerIn: parent
            width: Math.round(parent.width / 1.5)
            height: Math.round(parent.height / 2)
            radius: 25

            MouseArea{
                anchors.fill: parent
                onClicked: console.log("rect2")
            }
        }
    }


    Item {
        id:rect3_design
        anchors{
            left: rect2_design.right
            margins: 15
        }

        width: 300
        height: 300

        Rectangle {
            id: background3
            anchors.fill: parent
            color: "black"
        }

        RectangularGlow {
            id: effect3
            anchors.fill: rect3
            glowRadius: 20
            spread: 0.2
            color: "#5555ff"
            cornerRadius: rect3.radius + glowRadius
        }

        Rectangle {
            id: rect3
            color: "black"
            anchors.centerIn: parent
            width: Math.round(parent.width / 1.5)
            height: Math.round(parent.height / 2)
            radius: 25

            MouseArea{
                anchors.fill: parent
                onClicked: console.log("rect3")
            }
        }
    }


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
