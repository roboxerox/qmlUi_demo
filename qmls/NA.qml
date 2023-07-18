import QtQuick 2.0
import QtCharts 2.2
import QtQuick.Controls 2.2


Item {

    id: na_2
    anchors.fill: parent
    anchors.margins: 20

    Text {
        id: name
        anchors.centerIn: parent
        text: qsTr("Page not found")
        color: "white"
        font.pixelSize: 25
    }


    ///// EXIT Button
    Image {
        id: img_back_demochart
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
