import QtQuick 1.1
Rectangle{
    id: ramka_z_cieniem

    width:400
    height: 400
    color: "#00000000"
    radius: 1
    anchors.horizontalCenter: parent.horizontalCenter
    z: 3


    Rectangle {
        id: rectangle11
        color: "#00000000"
        radius: 15
        z: 1
        anchors.rightMargin: 3
        anchors.leftMargin: 3
        anchors.bottomMargin: 3
        anchors.topMargin: 3
        anchors.fill: parent
        border.width: 7
        border.color: "#e1e1e1"
    }

    Rectangle {
        id: rectangle21
        x: 0
        y: 0
        color: "#00000000"
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        z: 2
        anchors.fill: parent
        border.width: 10
        border.color: "#e1e1e1"
    }

    Rectangle {
        id: cien_dol1
        x: 3
        y: 3
        radius: 0
        gradient: Gradient {
            GradientStop {
                position: 0.950
                color: "#00000000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
        z: 0
        anchors.fill: parent
        anchors.topMargin: 3
        anchors.rightMargin: 3
        anchors.bottomMargin: 3
        anchors.leftMargin: 3
    }

    Rectangle {
        id: cien_gora1
        x: 3
        y: 3
        radius: 0
        rotation: 180
        anchors.fill: parent
        anchors.topMargin: 3
        anchors.rightMargin: 3
        anchors.bottomMargin: 3
        z: 0
        anchors.leftMargin: 3
        gradient: Gradient {
            GradientStop {
                position: 0.950
                color: "#00000000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
    }

    Rectangle {
        id: cien_lewa1
        x: 0
        y: 3
        radius: 0
        anchors.fill: parent
        anchors.topMargin: 3
        anchors.rightMargin: 3
        anchors.bottomMargin: 3
        rotation: 90
        z: 0
        anchors.leftMargin: 0
        gradient: Gradient {
            GradientStop {
                position: 0.950
                color: "#00000000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
    }

    Rectangle {
        id: cien_prawa1
        x: 3
        y: 3
        radius: 0
        anchors.fill: parent
        anchors.topMargin: 3
        anchors.rightMargin: 3
        anchors.bottomMargin: 3
        rotation: -90
        z: 0
        anchors.leftMargin: 3
        gradient: Gradient {
            GradientStop {
                position: 0.950
                color: "#00000000"
            }

            GradientStop {
                position: 1
                color: "#000000"
            }
        }
    }
}

