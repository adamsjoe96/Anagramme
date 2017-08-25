import QtQuick 2.7

Item {
    width: 600
    height: 400
    Rectangle{
        id :input
        width: 415
        height: 200
        radius: 10
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.left: parent.left
        anchors.leftMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 0.7
        color: "white"
        Rectangle{
            width: parent.width
            height: 45
            border.width: 1
            color: "lightSteelBlue"
            border.color: Qt.lighter(color, 0.1)
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            TextEdit{
                id: edit
                width: parent.width
                height: 45
                anchors.fill: parent
                text: "Entrer le mot ici"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.bold: true
                font.pixelSize: 17
                font.family: "Helvetica"
                focus: true
            }
        }

        /*Image {
            id: ig
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            source: "Images/pole.png"
          }
        Image {
            id: ig2
            anchors.right: parent.right
            anchors.top: parent.top
            source: "Images/pole.png"
          }*/
    }

    Score{
        id : score
        anchors.top: input.bottom
        anchors.left: input.left
        width: input.width
    }

    Hall{
        id: hall
        visible: score.set
        width: score.width/2
        height: 200 + score.height
        anchors.top: score.bottom
        anchors.left: score.left
    }
    SequentialAnimation{
        id : intro
        loops: Animation.Infinite
        running: false
        ColorAnimation {
            target: input
            from: "white"
            to: "black"
            duration: 2000
        }
        XAnimator{
            target: ig
            from: 600
            to : 0
            duration: 5000
            easing.type: Easing.InOutQuad
        }
        XAnimator{
//            running: ig.x === 600? true: false
            target: ig2
            from: 600
            to : 0
            duration: 5000
            easing.type: Easing.InOutQuad
        }
    }

}
