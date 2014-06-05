// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
Item{

    id:av
property string url_avatara




    Item {
        id: item2
        x: -8
        y: 21
        width: 117
        height: 101

        Rectangle {
            id: avatar3
            x: 14
            y: 7
            width: 95
            height: 92
            color: "#00000000"
            radius: 18
            clip: true
            border.color: "#e1e1e1"
            border.width: 10
            z: 6
            opacity: 1
        }

Image {id:vatar_image ; source: av.url_avatara ;x: 19; y: 10; width:84; height: 84;  z:2}

        Rectangle {
            id: avatar2
            x: 21
            y: 12
            width: 84
            height: 83
            color: "#00000000"
            radius: 18
            clip: true
            border.color: "#311919"
            border.width: 2
            z: 3
            opacity: 1
        }

        Rectangle{
            id: avatar

            border.width: 3
            border.color: "#e1e1e1"
            width:87; height: 86
            color: "#00000000"
            radius: 19
            opacity: 1
            clip: true
            x:18
            y:9
            z:5

        }

        Rectangle {
            id: avatar1
            x: 18
            y: 10
            width: 85
            height: 83
            color: "#00000000"
            radius: 19
            clip: true
            border.color: "#ffffff"
            border.width: 2
            z: 3
            opacity: 1
        }

    }




}
