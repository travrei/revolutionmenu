import QtQuick 2.15
import QtGraphicalEffects 1.15

Item{
    width:root.width
    height: root.height
    Image{
        id: bottom
        source: "assets/bb.png"
        height: vpx(200)
        smooth: true
        visible: true
        fillMode: Image.Streech
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        Text{
            id: collectionName

            color:"#828282"
            text: currentCollection.name
            font.pointSize: vpx(45)
            font.family: mainFont.name
            font.capitalization: Font.AllUppercase
            style: "Raised"

            anchors.topMargin: vpx(110)
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            z:1
        }
    }
}   
