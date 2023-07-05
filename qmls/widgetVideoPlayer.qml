import QtQuick 2.0
import QtMultimedia 5.8

//Rectangle {
//    id: video_output_page
//    anchors.fill: parent
//    color: "grey"

//    Video {
//        id: video
//        anchors{
//            top:parent.top
//            left: parent.left
//        }

//        width : 480
//        height : 360
//        source: "SuperTrees.mp4"

//        MouseArea {
//            anchors.fill: parent
//            onClicked: {
//                video.play()
//            }
//        }

//        focus: true
//        Keys.onSpacePressed: video.playbackState == MediaPlayer.PlayingState ? video.pause() : video.play()
//        Keys.onLeftPressed: video.seek(video.position - 5000)
//        Keys.onRightPressed: video.seek(video.position + 5000)
//    }



    //////////////////////////////


Rectangle {
    width: 800
    height: 600
    color: "black"

    MediaPlayer {
        id: player
//        source: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"
        source: "qrc:/images/sample_1280x720.mkv"
//        autoPlay: true
    }

    VideoOutput {
        id: videoOutput
        source: player
        anchors.fill: parent
        MouseArea {
            anchors.fill: parent
            onClicked: {
                player.playbackState == 1 ? player.pause() : player.play()
//                console.log(player.playbackState)
            }
        }
    }


    Image {
        id: img_back_video
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
