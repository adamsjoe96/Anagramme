import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Controls 1.4

Rectangle{
//    frameVisible: true
    width: 200
    height: 100
    ListModel{

        id : fameModel

        ListElement{
            name: "Dr. Hollow"
            ressource: "Images/winner.jpg"
            point: 150
        }
        ListElement{
            name: "Dr. Frankenstein"
            ressource:  "Images/winner.jpg"
            point: 150
        }
        ListElement{
            name: "Dr. Hockback"
            ressource:  "Images/winner.jpg"
            point: 150
        }
        ListElement{
            name: "Dr. Frankenstein"
            ressource:  "Images/winner.jpg"
            point: 150
        }
    }
    Component{
        id: fameDelegate
            Item{
                id: wrapper
                width: vue.width
                height: 30
                Rectangle{
                    id: m_name
                    width: parent.width/2
                    height: parent.height
                    border.width: 1
                    border.color: Qt.lighter(color, 0.1)
                    Text {
                        id : itel
                        anchors.fill: parent
                        anchors.centerIn: parent
                        text: name
                    }
                }
                Rectangle{
                    id :m_rang
                    width: 45
                    height: parent.height
                    border.width: 1
                    border.color: Qt.lighter(color, 0.1)
                    anchors.left: m_name.right
                    Text {
                        anchors.fill: parent
                        anchors.centerIn: parent
                        text: qsTr("" + point)
                    }
                }
                Rectangle{
                    width: 45
                    height: parent.height
                    border.width: 1
                    border.color: Qt.lighter(color, 0.1)
                    anchors.left: m_rang.right
                    Image{
                        anchors.fill: parent
                        fillMode: Image.PreserveAspectCrop
                        source: ressource
                    }
            }
        }
    }
    Component{
        id: highDelegate
        Rectangle{
            x: vue.currentItem.x
            y: vue.currentItem.y
            width: vue.currentItem.width
            height: vue.currentItem.height
            color: 'lightsteelblue'
        }
    }
    Component{
        id : head
        Column{
            spacing: 1
            Rectangle{
                width: vue.width
                height: 20
                border.width: 1
                border.color: Qt.lighter(color, 0.1)
                Text {
                    anchors.centerIn: parent
                    text: qsTr("Hall of Fame")
                }
            }
            Rectangle{
                width: vue.width
                height: 20
                Row{
                    width: parent.width
                    anchors.centerIn: parent
                    Rectangle{
                        width: parent.width/2; height: 20; border.width: 1
                        border.color: Qt.lighter(color, 0.1); Text {
                            anchors.centerIn: parent
                            text: qsTr("Name")
                        }}
                    Rectangle{width: 45; height: 20; border.width: 1
                        border.color: Qt.lighter(color, 0.1); Text {
                            anchors.centerIn: parent
                            text: qsTr("Points")
                        }}
                    Rectangle{width: 45; height: 20; border.width: 1
                        border.color: Qt.lighter(color, 0.1);  Text {
                            anchors.centerIn: parent
                            text: qsTr("Cup")
                        }}
                }
            }
        }
    }

    Rectangle{
        width: parent.width
        height: parent.height
        color: 'white'
        anchors.centerIn: parent
        border.color: Qt.lighter(color, 0.1)
        border.width: 1
        ListView{
            id: vue
            width: parent.width
            height: parent.height
//            anchors.fill: parent
            focus: true
            model: fameModel
            delegate: fameDelegate
            highlight: highDelegate
            header: head
            interactive: false
        }
    }
}

