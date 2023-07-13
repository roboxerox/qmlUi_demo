import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4
import QtMultimedia 5.8

Rectangle {
    id:web_cam_page
    anchors.fill: parent
    color: "black"

    Rectangle{
        id: menu_widget
        anchors{
            top: parent.top
            right:parent.right
            margins: 10
        }
        width: 200
        color: "darkgrey"

        Button{
            id: capture
            anchors{
                top: parent.top
                left: parent.left
                margins: 40
            }
            width: 150
            height: 50
            text: "Capture"
            onClicked: {
                console.log("Capture")
                //camera.imageCapture.capture();
            }
        }

        Button{
            id: flash_light
            anchors{
                top: capture.bottom
                left: parent.left
                margins: 40
            }
            width: 150
            height: 50
            text: "Flash"
            onClicked: {
                console.log("flash")
            }
        }

        Button{
            id: quit
            anchors{
                top: flash_light.bottom
                left: parent.left
                margins: 40
            }
            width: 150
            height: 50
            text: "Quit"
            onClicked: {
                main_loader.source = "qrc:/qmls/StackViewPage.qml"
            }
        }
    }

    Item {
        id: cam_view
        anchors{
            top:parent.top
            left: parent.left
            margins: 40
        }
        width: 720
        height: 480

        Camera {
            id: camera

            imageProcessing.whiteBalanceMode: CameraImageProcessing.WhiteBalanceFlash

            exposure {
                exposureCompensation: -1.0
                exposureMode: Camera.ExposurePortrait
            }

            flash.mode: Camera.FlashRedEyeReduction

            imageCapture {
                onImageCaptured: {
                    photoPreview.source = preview  // Show the preview in an Image
                }
            }
        }

        VideoOutput {
            source: camera
            anchors.fill: parent
            focus : visible // to receive focus and capture key events when visible
        }

        Image {
            id: photoPreview
        }
    }
}
