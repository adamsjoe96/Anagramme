import QtQuick 2.0
import QtQuick 2.7
import Mess 1.0


Rectangle{
    id :item
    property int chrono: 100
    width: 400
    height: 120
    border.width: 3
    color: "yellow"
    radius: 20
    border.color: Qt.lighter(color, 0.1)
    signal wordTransmit(string msg)
    Rectangle{
        id: rec1
        width: 80
        color: "orange"
        height: parent.height
        anchors.left: parent.right
        anchors.top: parent.top
    }
    Rectangle{
        id: rec2
        width: parent.width+rec1.width+rec4.width
        height: 45
        radius: -10
        color: "yellow"
        anchors.bottom: parent.top
        anchors.left: rec4.left
        Text{
            id: rec2Text
            visible: false
            anchors.centerIn: parent
//            anchors.fill: parent
            font.bold: true
            font.pixelSize: 20
            font.family: "Helvetica"
        }
    }
    Rectangle{
        id: rec3
         width: parent.width+rec1.width+rec4.width
         height: 45
         color: "green"
         anchors.top: parent.bottom
         anchors.left: rec4.left
         Direction{
             text: "Confirmer"
             anchors.centerIn: parent
             onClicked: {
                 checking()
             }
             function checking ()
             {
                 if(chrono!=0)
                 {
                     if(gaming.checkForName(edit.text))
                             {
                                 rec2Text.text = qsTr("Congratulation! You have found the Word")
                                 rec2Text.visible = true
                                 chrono=0
                                 screen.visible = false
                                 wrapper.state = "play"

                             }
                     else
                     {
                         rec2Text.text = qsTr("Please Try again!")
                         rec2Text.visible = true
                     }
                 }
                 else{
                     rec3Text.text = qsTr("We 're so sorry, You haven't found the word")
                 }


             }
         }

    }
    Rectangle{
        id: rec4
        width: 80
        color: "blue"
        height: parent.height
        anchors.right: parent.left
        anchors.top: parent.top
    }
    Billeau{
        id: b1
        width: 30
        height: 30
        anchors.left: rec1.right
        anchors.verticalCenter: rec1.verticalCenter
        color: "blue"
    }
    Billeau{
        width: 30
        height: 30
        anchors.left: rec1.right
        anchors.top: b1.bottom
        color: "blue"
    }
    Billeau{
        id: b2
        width: 50
        height: 50
        anchors.bottom: rec2.top
        anchors.horizontalCenter: rec2.horizontalCenter
    }
    Billeau{
        width: 50
        height: 50
        anchors.left: b2.right
        anchors.bottom: rec2.top
    }
    Billeau{
        id: b3
        width: 50
        height: 50
        anchors.top: rec3.bottom
        anchors.horizontalCenter: rec3.horizontalCenter

    }
    Billeau{
        width: 50
        height: 50
        anchors.left: b3.right
        anchors.top: rec3.bottom
    }
    Billeau{
        id: b4
        width: 30
        height: 30
        anchors.right: rec4.left
        anchors.verticalCenter: rec4.verticalCenter
    }
    Billeau{
        width: 30
        height: 30
        anchors.top: b4.bottom
        anchors.right: rec4.left

    }

    function chronos()
    {
        if (chrono)
        {
            chrono--;
            chrori.interval = 2000
        }

    }
    Text {
        id: chron
        text: qsTr("CHRONO: " + chrono)
        font.bold: true
        font.pixelSize: 20
        font.family: "Helvetica"
        Timer{
            id: chrori
            running: true
            onTriggered: chronos()
            interval: 1000
            repeat: true
        }
    }
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
    Text {
        id: time
        anchors.right: parent.right
        anchors.bottom: parent.bottom
    }
}
