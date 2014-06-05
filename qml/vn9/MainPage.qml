import QtQuick 1.1
import com.nokia.meego 1.0
import QtMultimediaKit 1.1
import "vinenine.js" as Logic



Page {

    orientationLock: PageOrientation.LockPortrait
                  State { name: 'loaded'; when: image1.status == Image.Ready }
    Item {
        id: item3
        anchors.fill: parent
        BusyIndicator {
            id: indicator3
            x:143+40
            y:180
            width: 174
            height: 121

            visible:true
            z: 10
            running: true
            platformStyle: BusyIndicatorStyle {

                size: "large"
            }


        }
    }
    property int index_wybrany
    property string wybran_kategoria
    property string share_url
    tools: commonTools
        id:vine
        width: 480
        height: 854
        z: 0

        Item{
            id: item1
            x: 0
            y: 39
            width: 480
            height: 815
            anchors.topMargin: 39
            anchors.fill: parent
            z:4
Ramki{id:ramka_z_cieniem;x:30;y:9}
Ramka_avatar{id:ramka_avatara;
x: 8
y: 395
width: 113
height: 134
z:2
}


Text {id:nazwa_usera; x: 113;  y:424; width: 360; height: 35; color: "#21be92"; text: ""; font.family: "Helvetica"; style: Text.Sunken; font.pointSize: 20;z:4 }
Text {id:tytul; x: 113;  y:459; width: 360; height: 61; color: "#aa3232"; text: ""; font.italic: true; wrapMode: Text.WordWrap; font.pointSize: 14;z:2 }
Text {id:ilosc_likow ; x: 113; y: 500; width: 50; height: 36;text: "" ; visible: true; font.pointSize: 12; z: 4;}
                               Rectangle {
                                   id: rectangle1
                                   x: 0
                                   y: 404
                                   width: 480
                                   height: 444
                                   color: "#e1e1e1"
                                   z: 1
                                   visible: true
                                   anchors.horizontalCenter: parent.horizontalCenter
                                   anchors.horizontalCenterOffset: 0
                               }
                                   Rectangle {
                                       id: rectangle2
                                       x: 0
                                       y: -38
                                       width: 480
                                       height: 52
                                       color: "#e1e1e1"
                                       anchors.horizontalCenter: parent.horizontalCenter
                                       anchors.horizontalCenterOffset: 0
                                       Text {
                                           id: kategoria
                                           x: 14
                                           y: 1
                                           width: 201
                                           height: 37
                                           color: "#21be92"
                                           text: qsTr(appWindow.kategorie(wybran_kategoria))
                                           font.bold: true
                                           font.family: "Libian SC"
                                           style: Text.Sunken
                                           font.italic: true
                                           font.pixelSize: 28
                                       }
                                   }
                        }
        Component {


            id: gridDelegate
Item {

State { name: 'loaded'; when: image.status == Image.Ready }


    id:wrapper;width: photoGridView.cellWidth; height: photoGridView.cellHeight
    Image {id:avatar_ ;source: avatarUrl; width:84; height: 84;  z:1;visible:false}
    Text {id:expanded_url_ ;text: expanded_url; visible:false}
    Text {id:username_ ;text: username; visible:false}
    Text {id:tytul_ ;text: text; visible:false}
    Text {id:id_ ;text: id; visible:false}
    Video {id: video;x: 40;y: 9;z: 2;width:400; height: 400;autoLoad: false;playing: false; visible: true; fillMode: "PreserveAspectFit"
        objectName:"vinevideo";
        function myQmlFunction(msg) {
        if(index!=index_wybrany){
            console.log('got some Items'+msg);
            video.source="/home/user/"+video_url;
            video.visible = true;
            video.play();
        }
        return "some return value"
        }


onError: {
    indicator3.running=true
    indicator3.visible=true
}

onStarted: {
    indicator3.running=false
    indicator3.visible=false
}

onPositionChanged: {
       //console.log("onPositionChanged")

}
onPlayingChanged: {
     //   console.log("onPlayingChanged")
}
        onFocusChanged: {
            console.log("fokus")
}
        function cos(){

            console.log("cos")
        }
        function aa(){

        }

       MouseArea {
          anchors.fill: parent
          onMouseYChanged:
                           {
if(index!=index_wybrany){
  video.stop()
    index_wybrany=index
    //vatar_image.source=avatar_.source
    ramka_avatara.url_avatara=avatar_.source
    share_url=expanded_url_.text
    //vatar_image.source=avatar_.source
    tytul.text=description
    nazwa_usera.text=username
//  ApplicationData.downloadFile(video_url_org);

    video.source="/home/user/"+video_url;
    video.visible = true;
    video.play();
    console.log(index+" play "+video_url);
          }
                  }
          onClicked: {index_wybrany=index}
}
                               onStopped: {
                                   video.position = 0;
                                   video.play()
                               }

                                onBufferProgressChanged: {
                                  //   console.log('bufor'+video.bufferProgress)
                                }

                               Component.onCompleted: {
                                  // console.log('complet')
                               //      ApplicationData.downloadFile(video_url_org);
                                   ramka_avatara.url_avatara=rssModel.get(0).avatarUrl
                        //vatar_image.source=rssModel.get(0).avatarUrl
                        tytul.text=rssModel.get(0).description
                        nazwa_usera.text=rssModel.get(0).username

                               }
 }
                           Image {
                               id: image1//podglad filmu
                               x: 40
                               y: 9
                               width: 400
                               height: 400
                               anchors.horizontalCenterOffset: 0
                               opacity: 1
                               clip: false
                               visible: true
                               fillMode: Image.Stretch
                               sourceSize.height: 600
                               sourceSize.width: 600
                               source: thumbnail_url
                               z:1
                              onStatusChanged: if (image1.status == Image.Ready) {lista_end()}
                        }
                }//koniec item
         }//koniec Component
        ListModel { id: rssModel;
        }
        ListModel { id: komentarz_model  }


        ListView {
            x:19;y:565
            width: 447; height: 295
            model: komentarz_model
            delegate: Text {
                text: username + ": " + comment
            }
            z:10
        }



        GridView {
            onBoundsBehaviorChanged: {
                     console.log("onBoundsBehaviorChanged")
            }

            onMovementEnded: {}
            onContentYChanged: {
//                   console.log("bbbbbb")


            }

            onAtYEndChanged: {

              //  console.log("aaaa")
            }

            onMovingHorizontallyChanged: {
                //  console.log("suwanko w pionie",video.source)
            }
              onMovingChanged: {
                //  console.log("suwanko",video.source)
              }
            id: photoGridView; x: 0; y: 51; width: 480; height: 399; highlightRangeMode: GridView.ApplyRange; boundsBehavior: Flickable.StopAtBounds; snapMode: GridView.SnapOneRow; clip: true; model: rssModel; delegate: gridDelegate; cacheBuffer: 20000
            cellWidth: (parent.width-80); cellHeight: cellWidth;
        }

        Component.onCompleted: lista("popular","","")
        function play_vine(){
            //TO DO guzik play
             //ApplicationData.downloadFile(rssModel.get(index_wybrany).video_url_org);
            //console.log(rssModel.get(index_wybrany).video_url)
console.log(video)

            index_wybrany=photoGridView.contentY/400

        //console.log("/home/user/"+rssModel.get(index_wybrany).video_url)

            ramka_avatara.url_avatara=rssModel.get(index_wybrany).avatarUrl
           // share_url=rssModel.get(index_wybrany).expanded_url
            tytul.text=rssModel.get(index_wybrany).description
            nazwa_usera.text=rssModel.get(index_wybrany).username



        //rssModel.get(index_wybrany).video.stop()
        //rssModel.get(index_wybrany).video.source="/home/user/"+rssModel.get(index_wybrany).video_url
        //rssModel.get(index_wybrany).video.visible = true;
        //rssModel.get(index_wybrany).video.play()
    }
        function play_next(){

            if(photoGridView.contentY!=photoGridView.contentHeight-400) photoGridView.contentY+=400

        }
        function play_prev(){

if(photoGridView.contentY!=0)photoGridView.contentY-=400

        }
    function lista_end(){
       indicator3.running=false
       indicator3.visible=false
    }
    function lista(kategoria,tag,userid){
            wybran_kategoria=kategoria
            Logic.lista(kategoria,tag,userid)
    }


}
