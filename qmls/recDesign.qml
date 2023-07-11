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


    Item {
        id:rect4_design
        anchors{
            top: rect1_design.bottom
            left: parent.left
            margins: 15
        }

        width: 200
        height: 200

        Rectangle {
            id: background4
            anchors.fill: parent
            color: "black"
        }

        RectangularGlow {
            id: effect4
            anchors.fill: rect4
            glowRadius: 30
            spread: 0.3
            color: "#FF0000"
            cornerRadius: rect4.radius + glowRadius
        }

        Rectangle {
            id: rect4
            color: "black"
            anchors.centerIn: parent
            width: Math.round(parent.width / 2)
            height: Math.round(parent.height / 2)
            radius: 100

            MouseArea{
                anchors.fill: parent
                onClicked: console.log("rect4")
            }
        }
    }


    Item {
        id:rect5_design
        anchors{
            top: rect1_design.bottom
            left: rect4_design.right
            margins: 15
        }

        width: 200
        height: 200

        Rectangle {
            id: background5
            anchors.fill: parent
            color: "black"
        }

        RectangularGlow {
            id: effect5
            anchors.fill: rect5
            glowRadius: 30
            spread: 0.3
            color: "#FFF010"
            cornerRadius: rect5.radius + glowRadius
        }

        Rectangle {
            id: rect5
            color: "black"
            anchors.centerIn: parent
            width: Math.round(parent.width / 2)
            height: Math.round(parent.height / 2)
            radius: 100

            MouseArea{
                anchors.fill: parent
                onClicked: console.log("rect5")
            }
        }
    }

    Item {
        id:rect6_design
        anchors{
            top: rect1_design.bottom
            left: rect5_design.right
            margins: 15
        }

        width: 200
        height: 200

        Rectangle {
            id: background6
            anchors.fill: parent
            color: "black"
        }

        RectangularGlow {
            id: effect6
            anchors.fill: rect6
            glowRadius: 30
            spread: 0.3
            color: "#00FFFF"
            cornerRadius: rect6.radius + glowRadius
        }

        Rectangle {
            id: rect6
            color: "black"
            anchors.centerIn: parent
            width: Math.round(parent.width / 2)
            height: Math.round(parent.height / 2)
            radius: 100

            MouseArea{
                anchors.fill: parent
                onClicked: console.log("rect6")
            }
        }
    }



    Item {
        id:rect7_design
        anchors{
            top: rect1_design.bottom
            left: rect6_design.right
            margins: 15
        }

        width: 200
        height: 200

        Rectangle {
            id: background7
            anchors.fill: parent
            color: "black"
        }

        RectangularGlow {
            id: effect7
            anchors.fill: rect7
            glowRadius: 30
            spread: 0.3
            color: "#00FF80"
            cornerRadius: rect7.radius + glowRadius
        }

        Rectangle {
            id: rect7
            color: "black"
            anchors.centerIn: parent
            width: Math.round(parent.width / 2)
            height: Math.round(parent.height / 2)
            radius: 100

            MouseArea{
                anchors.fill: parent
                onClicked: console.log("rect7")
            }
        }
    }





    Image {
        id: img_back_recDesign
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
