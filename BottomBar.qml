import QtQuick 2.15
import QtGraphicalEffects 1.15

Item{
Rectangle{
    id: back
    x: vpx(-10)
    y: vpx(520)
    width: vpx(1300)
    height: vpx(240)
    color: "transparent"

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


    Image{
        id: bottom
        source: "assets/bb.svg"
        smooth: true
        visible: true
        width: back.width
        height: back.height 
    }
}
}   
