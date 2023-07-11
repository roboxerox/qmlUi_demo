import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Rectangle{
    id:gamma_adjustment
    anchors.fill: parent

    color: "grey"

    Item {
        id: org_image_g
        anchors{
            top:parent.top
            left: parent.left
            margins: 25
            leftMargin: 65
        }

        width: 400
        height: 400

        Image {
            id: bug_org_g
            source: "qrc:/images/bug.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: true
        }

        Text {
            id: gamma_val0
            anchors{
                top:bug_org_g.bottom
            }
            color: "white"
            text: qsTr("gamma 1.0")
        }
    }
    property real iGamma: 1.0

    Item {
        id:g_ench1_image
        anchors{
            left: org_image_g.right
            top:parent.top
            margins: 25
        }

        width: 400
        height: 400

        Image {
            id: bug1g_enhance
            source: "qrc:/images/bug.png"
            sourceSize: Qt.size(parent.width, parent.height)
            smooth: true
            visible: false
        }

        GammaAdjust {
            anchors.fill: bug1g_enhance
            source: bug1g_enhance
            gamma: iGamma       // The value ranges from 0.0 (darkest) to inf (lightest). By default, the property is set to 1.0 (no change).
        }

        Text {
            id: gamma_val1
            anchors{
                top:bug1g_enhance.bottom
            }
            color: "white"
            text: qsTr("gamma "+iGamma)
        }
    }

    RowLayout {
        id: gsettings_row
        height: 100
        spacing:25
        anchors {
            left: parent.left
            top: org_image_g.bottom
            leftMargin: 65
        }


        Text {
            id: gamma_text
            width: 100
            text: qsTr("gamma value :")
            font.pixelSize: 20
            color: "white"
        }

        ComboBox {
            id: gamma_combobox
            width: 100
            height: 50
            model: [ "0.0", "0.2", "0.4","0.6","0.8","1.0","1.2","1.4","1.6","1.8","2.0","2.0","2.4","2.6","2.8","3.0","3.5","4.0","4.5","5.0"]
            currentIndex: 5
            onCurrentIndexChanged:{
                iGamma = gamma_combobox.textAt(currentIndex)
            }
        }
    }



    Image {
        id: img_back_gamma
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
