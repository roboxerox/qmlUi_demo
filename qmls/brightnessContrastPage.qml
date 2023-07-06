import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Rectangle{
    id:brightness_contrast_adjustment
    anchors.fill: parent

    color: "grey"

    Item {
        id: org_image_b
        anchors{
            top:parent.top
            left: parent.left
            margins: 25
            leftMargin: 65
        }

        width: 400
        height: 400

        Image {
            id: bug_org_b
            source: "qrc:/images/bug.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: true
        }

        Text {
            id: brightness_contrast_val0
            anchors{
                top:bug_org_b.bottom
            }
            color: "white"
            text: qsTr("brightness_contrast 1.0")
        }
    }
    property real iBrightness: 0.0
    property real iContrast: 0.0

    Item {
        id:b_ench_image
        anchors{
            left: org_image_b.right
            top:parent.top
            margins: 25
        }

        width: 400
        height: 400

        Image {
            id: bug1b_enhance
            source: "qrc:/images/bug.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: false
        }

        BrightnessContrast {
            anchors.fill: bug1b_enhance
            source: bug1b_enhance
            brightness: iBrightness
            contrast: iContrast
        }

        Text {
            id: brightness_contrast_val1
            anchors{
                top:bug1b_enhance.bottom
            }
            color: "white"
            text: qsTr("brightness: "+iBrightness + ", Contrast: "+iContrast)
        }
    }

    RowLayout {
        id: bsettings_row
        height: 100
        spacing:25
        anchors {
            left: parent.left
            top: org_image_b.bottom
            leftMargin: 65
            topMargin: 10
        }


        Text {
            id: bightness_text
            width: 100
            text: qsTr("brightness value :")
            font.pixelSize: 20
            color: "white"
        }

        ComboBox {
            id: brightness_combobox
            width: 100
            height: 50
            currentIndex: 10
            model: [ "-1", "-0.9", "-0.8","-0.7","-0.6","-0.5","-0.4","-0.3","-0.2","-0.1","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1" ]
            onCurrentIndexChanged:{
                iBrightness = brightness_combobox.currentText
            }
        }

        Text {
            id: contrast_text
            width: 100
            text: qsTr("contrast value :")
            font.pixelSize: 20
            color: "white"
        }

        ComboBox {
            id: contrast_combobox
            width: 100
            height: 50
            currentIndex: 10
            model: [ "-1", "-0.9", "-0.8","-0.7","-0.6","-0.5","-0.4","-0.3","-0.2","-0.1","0","0.1","0.2","0.3","0.4","0.5","0.6","0.7","0.8","0.9","1" ]
            onCurrentIndexChanged:{
                iContrast = contrast_combobox.currentText
            }
        }
    }



    Image {
        id: img_back_brightness_contrast
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
