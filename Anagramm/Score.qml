import QtQuick 2.0

Rectangle{
    property bool set: false
    border.width: 1.5
    color: "yellow"
    height: 50
    Text {
        id: score
//        anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
//        anchors.fill: parent
        text: qsTr("Score: ")
    }
    Direction{
        text: qsTr("Play")
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
    }
    Direction{
        id :stop
        text: qsTr("Stop")
        anchors.top: parent.top
//        anchors.top: input.bottom
        anchors.topMargin: 5
        anchors.right: parent.right
        anchors.rightMargin: 5
    }
    Direction{
        id: hall
        text: qsTr("Hall of Fame")
        anchors.right: stop.left
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 5
        onClicked: checkForGame()//set = !set
    }

    function checkForGame()
    {
        var list = gaming.randomChoice();
//        for(var i = 0; i<list.lenght; i++)
            console.log(list[0])
//        gaming.checkForRandomName(gaming.generateName(list));
    }
}
