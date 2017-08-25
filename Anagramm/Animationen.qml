import QtQuick 2.0
import QtQuick 2.7

Item {
    property int time: 4000
    property var cible: this
    property alias tox1: xnum1.to
    property alias toy1: ynum1.to
    property alias toangle1 : angle1.to
    property alias tox2 : xnum2.to
    property alias toy2 : ynum2.to
    property alias toangle2: angle2.to
ParallelAnimation{
    running: true
    SequentialAnimation{
        loops: Animation.Infinite
        ParallelAnimation{
            NumberAnimation {
                id :xnum1
                target: cible
                property: "x"
                to : 360
                duration: time
                easing.type: Easing.InCubic
            }
            NumberAnimation {
                id : ynum1
                target: cible
                property: "y"
                to : 450
                duration: time
                easing.type: Easing.InOutCubic
            }
            RotationAnimator{
                id : angle1
                target: cible
                from: 0
                to: 360
                duration: time
                easing.type: Easing.InOutQuad
            }
        }
        ParallelAnimation{
            NumberAnimation {
                id: xnum2
                target: cible
                property: "x"
                to : 800
                duration: time +20
                easing.type: Easing.InOutCubic
            }
            NumberAnimation {
                id : ynum2
                target: cible
                property: "y"
                to : 280
                duration: time
                easing.type: Easing.InOutQuad
            }
            RotationAnimator{
                id: angle2
                target: cible
                from: 0
                to: 600
                duration: time
                easing.type: Easing.InOutQuad
                }
            }

        }
    }
}
