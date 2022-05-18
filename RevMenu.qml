import QtQuick 2.15
import QtGraphicalEffects 1.15

FocusScope {
    Image{
    anchors.fill: parent  
    fillMode: Image.Tile
    source:"assets/fundo.png"
    }

    Component{
    id: highlight
      Rectangle{
        width: vpx(260); height: vpx(142)
        color: "transparent"; radius:vpx(15)
        border.color: "#34beed"
        border.width: vpx(6)
        x: menu.currentItem.x
        y: menu.currentItem.y
        z: 2
      }
    }

 GridView {
    id: menu

    x: vpx(109)
    y: vpx(61)
    
    width: vpx(1171)
    height: vpx(474)
    
    flickableDirection: Flickable.AutoFlickIfNeeded
    boundsMovement: Flickable.StopAtBounds
    boundsBehavior: Flickable.StopAtBounds
    flow: GridView.FlowTopToBottom
    
    cellHeight: vpx(151)
    cellWidth: vpx(270)
    
    delegate: GameGridItem { }
    
    model: currentCollection.games
    
    focus: true
    highlight: highlight
    highlightFollowsCurrentItem: false

     Keys.onPressed: {
       if(api.keys.isAccept(event))
         currentCollection.games.get(currentIndex).launch();
     }
  }

  BottomBar{
    z: 2
  }

}

