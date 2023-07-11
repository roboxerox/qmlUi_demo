import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: hue_saturation
    anchors.fill: parent
    color: "grey"


    Item {
        id: org_image_h
        anchors{
            top:parent.top
            left: parent.left
            margins: 25
            leftMargin: 65
        }

        width: 400
        height: 400

        Image {
            id: bug_org_h
            source: "qrc:/images/bug.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: true
        }

        Text {
            id: real_default_values
            anchors{
                top:bug_org_h.bottom
            }
            color: "white"
            text: qsTr("hue: 0, Satutartion: 0, Lightness: 0")
        }
    }

    property real iHue: 0.0
    property real iSaturation: 0.0
    property real ilightness: 0.0

    Item {

        id:h_ench1_image
        anchors{
            left: org_image_h.right
            top:parent.top
            margins: 25
        }
        width: 400
        height: 400

        Image {
            id: bug1h_enhance
            source: "qrc:/images/bug.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: false
        }

        HueSaturation {
            anchors.fill: bug1h_enhance
            source: bug1h_enhance
            hue: iHue
            saturation: iSaturation
            lightness: ilightness
        }

        Text {
            id: real_values
            anchors{
                top:bug1h_enhance.bottom
            }
            color: "white"
            text: qsTr("hue: " + iHue +", Satutartion: " + iSaturation + ", Lightness: " +ilightness)
        }
    }

    RowLayout {
        id: hsettings_row
        height: 100
        spacing:10
        anchors {
            left: parent.left
            top: org_image_h.bottom
            leftMargin: 65
            topMargin: 10
        }


        Text {
            id: hue_text
            width: 100
            text: qsTr("hue :")
            font.pixelSize: 20
            color: "white"
        }

        ComboBox {
            id: hue_combobox
            width: 100
            height: 50
            model: [ "-1", "-0.9", "-0.8","-0.7","-0.6","-0.5","-0.4","-0.3","-0.2","-0.1","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1" ]
            currentIndex: 10
            onCurrentIndexChanged:{
                iHue = hue_combobox.textAt(currentIndex)
            }
        }

        Text {
            id: saturation_text
            width: 100
            text: qsTr("saturation :")
            font.pixelSize: 20
            color: "white"
        }

        ComboBox {
            id: saturation_combobox
            width: 100
            height: 50
            model: [ "-1", "-0.9", "-0.8","-0.7","-0.6","-0.5","-0.4","-0.3","-0.2","-0.1","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1" ]
            currentIndex: 10
            onCurrentIndexChanged:{
                iSaturation = saturation_combobox.textAt(currentIndex)
            }
        }

        Text {
            id: lightness_text
            width: 100
            text: qsTr("lightness :")
            font.pixelSize: 20
            color: "white"
        }

        ComboBox {
            id: lightness_combobox
            width: 100
            height: 50
            model: [ "-1", "-0.9", "-0.8","-0.7","-0.6","-0.5","-0.4","-0.3","-0.2","-0.1","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1" ]
            currentIndex: 10
            onCurrentIndexChanged:{
                ilightness = lightness_combobox.textAt(currentIndex)
            }
        }

        Button{
            id:default_test
            width: 100
            height: 50
            text: "Test"

            onClicked: {
                iHue = -0.3
                iSaturation = 0.5
                ilightness = -0.1

                console.log("Hue:" + iHue +" Satutartion:" + iSaturation + " Lightness:" +ilightness)
            }
        }
    }



    ///// EXIT Button
    Image {
        id: img_back_hue
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
