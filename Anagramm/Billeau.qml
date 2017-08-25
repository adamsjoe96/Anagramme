import QtQuick 2.0
import QtQuick 2.7

Rectangle{
    id: rec
    width: 20
    height: 20
    radius: width /2
    color: "orange"
    NumberAnimation{
        target: rec
        loops: Animation.Infinite
        running: true
        from: 0
        to: 360
        duration: 1000
    }

//    transformOrigin: Item.Center
}
