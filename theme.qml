import QtQuick 2.15
import QtMultimedia 5.15
FocusScope{
    id:root
    //FontLoader & Variables
    property int currentCollectionIndex: 0
    property var currentCollection: api.collections.get(currentCollectionIndex)
    property int currentGameIndex: 0

    FontLoader { id: mainFont; source: "assets/fonts/contb.ttf" }
    FontLoader { id: cellFont; source: "assets/fonts/contm.ttf" }

    //Keys Section
    Keys.onPressed: {
        if (event.isAutoRepeat)
            return;

        if (api.keys.isPrevPage(event)) {
            event.accepted = true;
            if(currentCollectionIndex <= 0)
                currentCollectionIndex = api.collections.count - 1;
            else
                currentCollectionIndex--;
                sPage.play();
        }
        if (api.keys.isNextPage(event)) {
            event.accepted = true;
            if(currentCollectionIndex >= api.collections.count - 1)
                currentCollectionIndex = 0;
            else
                currentCollectionIndex++;
                sPage.play();
        }
    }

    Keys.onLeftPressed: {
        if(currentCollectionIndex <= 0)
            currentCollectionIndex = api.collections.count - 1;
        else
            currentCollectionIndex--;
            sPage.play();
    }

    Keys.onRightPressed: {
        if(currentCollectionIndex >= api.collections.count - 1)
            currentCollectionIndex = 0;
        else
            currentCollectionIndex++;
            sPage.play();
    }  

    //Menus

    RevMenu{
        id:revmenu
        anchors.fill: parent
        focus: true
        visible: opacity > 0.01
        opacity: focus ? 1.0 : 0.0
    }
    BottomBar{
        id:bb
        z: 2
    }
    

//===================
//|     Sounds!     |
//===================

Audio {
    id: bgmusic
    source:"assets/sounds/bg.wav"
    autoPlay: true
    loops: Audio.Infinite
    }

SoundEffect{
    id:sPage
    source: "assets/sounds/page.wav"
}
SoundEffect{
    id:sSelect
    source: "assets/sounds/select.wav"
}
}
