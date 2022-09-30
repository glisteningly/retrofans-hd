import QtQuick 2.12
import QtGraphicalEffects 1.12
import QtGraphicalEffects 1.0
import QtQuick.Layouts 1.15
import QtMultimedia 5.15

Item {
    property var screenshot: null
    property var video: null
    id: gameScreenshot
    width: parent.width
    height: parent.height
    property var active: false
    property var pauseVideo: false
    onPauseVideoChanged: {
        if (video && active) {
            if (pauseVideo) {
                videoPlayer.pause()
            } else {
                videoPlayer.play()
            }
        }
    }
    onActiveChanged: {
        if (video && active) {
            videoPlayer.play()
        } else {
            videoPlayer.stop()
        }
    }

    // Shadow. Using an image for better shadow visuals & performance.
    Image {
        visible: screenshot || video
        id: game_box_shadow
        source: "../assets/images/cover-shadow.png"
        width: (371 / 200) * parent.width
        height: (371 / 200) * parent.height - vpx(4)
        fillMode: Image.Stretch
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }

    Item {
        property bool rounded: true
        anchors.fill: parent

        Image {
            source: screenshot
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
        }

        Video {
            id: videoPlayer
            anchors.fill: parent
            fillMode: Image.PreserveAspectCrop
//            fillMode: Image.PreserveAspectFit
            source: video
            autoPlay: true
            loops: MediaPlayer.Infinite 
        }

//        layer.enabled: rounded
//        layer.effect: OpacityMask {
//            maskSource: Item {
//                width: gameScreenshot.width
//                height: gameScreenshot.height
//                Rectangle {
//                    anchors.centerIn: parent
//                    width: gameScreenshot.width
//                    height: gameScreenshot.height
//                    radius: vpx(6)
//                }
//            }
//        }

    }
}
