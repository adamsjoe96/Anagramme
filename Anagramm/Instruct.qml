import QtQuick 2.0

Item {
    property alias text: ins.text
//    property alias opacity: shape.opacity
//    property alias rotation: shape.rotation
    Rectangle{
        id: shape
        width: parent.width
        height: parent.height
        anchors.fill: parent
        visible: true
        border.color: "#151515"
        color : "#FE9A2E"
        border.width: 1.2
        Text {
            id: ins
            anchors.fill: parent
            text: qsTr("<h1>But du jeu</h1><br><p>

                        le But du jeu est très simple:<br>  trouvez le mot et devenez une légende.<br>
                        Ne le trouvez pas et soyez un Looser<br><br>")
            clip: true
            horizontalAlignment: Text.AlignJustify
            verticalAlignment: Text.AlignJustify
            wrapMode: Text.WordWrap
        }
    }
}
