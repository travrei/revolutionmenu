import QtQuick 2.15
import QtGraphicalEffects 1.12
import QtMultimedia 5.15

Item{
    x: 5
    height: 50
    Column {
        Rectangle {
            id: gamecell
            width: vpx(258)
            height: vpx(140)
            color: "#ffffff"
            radius: vpx(15)
            border.color: "#b4b4b4"
            border.width: vpx(6)
            anchors.horizontalCenter: parent.horizontalCenter
            Rectangle {
                id: mask

                width: gamecell.width
                height: gamecell.width
                anchors.fill: imagein
                radius: vpx(15)
                visible: true
                }

            OpacityMask {
                anchors.fill: imagein
                source: imagein
                maskSource: mask
                }

            Image{
                id:imagein
            
                anchors.fill: parent
                visible: false
                sourceSize { width: vpx(256); height: vpx(256) }
                clip: true
                fillMode: Image.PreserveAspectCrop
                smooth: true
                asynchronous: true
                source: assets.banner || assets.steam || assets.boxFront
            }
            Text{
                id:title
                text: modelData.title
                width: gamecell.width
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode:Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                visible: imagein.status !== Image.Ready
            }
        }
    }
}