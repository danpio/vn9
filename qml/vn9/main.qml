import QtQuick 1.1
import com.nokia.meego 1.0
import ShareCommand 1.0


PageStackWindow {

    function kategorie(kat){
        switch(kat){
        case 'popular':
        kat ="Popular now";
        break;
        case 'promoted':
        kat ="Promoted";
        break;
        case 'magic':
        kat ="Magic";
        break;
        case 'howto':
        kat ="Howto";
        break;
        case 'soon':
        kat ="Soon";
        break;
        case 'timelines':
        kat ="Timelines";
        break;
        case 'me':
        kat ="Me";
        break;



        }
return kat


    }

    id: appWindow

    initialPage: mainPage
    //showStatusBar: false
    MainPage {
        id: mainPage
    }

    ToolBarLayout {
        id: commonTools
        visible: true
        ToolIcon { iconId: "toolbar-share"
            onClicked: {
                sharer.share(mainPage.share_url)
               // shareImage.share(mainPage.share_url);
                console.log("share"+mainPage.share_url)
        }
        }
        ToolIcon { iconId: "toolbar-mediacontrol-previous"
            onClicked: mainPage.play_prev();}
        ToolIcon { iconId: "toolbar-mediacontrol-play"
            onClicked: mainPage.play_vine();}
        ToolIcon { iconId: "toolbar-mediacontrol-next"
            onClicked: mainPage.play_next();}
        ToolIcon {
            platformIconId: "toolbar-view-menu"
            anchors.right: (parent === undefined) ? undefined : parent.right
            onClicked: (myMenu.status === DialogStatus.Closed) ? myMenu.open() : myMenu.close()
        }

    }
    ShareCommand {

            id: sharer
        }
    Menu {
        id: myMenu
        visualParent: pageStack
        MenuLayout {
            MenuItem { text: qsTr(kategorie('popular'));onClicked: {mainPage.lista("popular","","");console.log("Wczytanie nowej listy Popular")}}
            MenuItem { text: qsTr(kategorie('promoted'));onClicked: {mainPage.lista("promoted","","");console.log("Wczytanie nowej listy promoted")}}
            MenuItem { text: qsTr(kategorie('magic'));onClicked: {mainPage.lista("magic","","");console.log("Wczytanie nowej listy Popular")}}
            MenuItem { text: qsTr(kategorie('howto'));onClicked: {mainPage.lista("howto","","");console.log("Wczytanie nowej listy howto")}}
            MenuItem { text: qsTr(kategorie('soon'));onClicked: {mainPage.lista("soon","","");console.log("Wczytanie nowej listy soon")}}
            MenuItem { text: qsTr(kategorie('me'));onClicked: {mainPage.lista("me","","");console.log("Wczytanie nowej listy me")}}
            MenuItem { text: qsTr(kategorie('timelines'));onClicked: {mainPage.lista("timelines","","");console.log("Wczytanie nowej listy timelines")}}
            MenuItem { text: qsTr("Refresh")
                onClicked: {

                    mainPage.lista()
                    console.log("Wczytanie nowej listy")


                }
            }
            MenuItem { text: qsTr("Setings")
                onClicked: {

               console.log("ustawienia")



                }
            }
        }
    }
}
