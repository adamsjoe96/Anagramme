import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Window {
//    id : interface
    visible:  true
    width: 800
    height: 480
    minimumHeight: 400
    minimumWidth: 750
    maximumHeight: 480
    maximumWidth: 800
    color: "steelblue"
    title: qsTr("Anagramme")
    Image {
        id: background
        source: "Images/alpha.jpg"
    }
    Lanim{}
    Game{
        id :game
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
    }
    Item {
        id: wrapper
        visible:  true
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        width: parent.width
        height: parent.height
        state: "normal"
        transitions: [
            Transition {
                from: "normal"
                to: "expanded"

                NumberAnimation {
                    target: but
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 4000
                    easing.type: Easing.Linear
                }

                NumberAnimation {
                    target: but
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 4000
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    target: but
                    property: "rotation"
                    to: 360
                    duration: 3000
                    easing.type: Easing.InQuad
                }
            },
            Transition {
                from: "expanded"
                to: "expanded2"
                NumberAnimation {
                    target: but
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 4000
                    easing.type: Easing.Linear
                }
                NumberAnimation {
                    target: instruct
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 4000
                    easing.type: Easing.Linear
                    }
                },
            Transition {
                from: "expanded2"
                to: "game1"
                XAnimator{
                    target: bille
                    from: 0
                    to: 400
                    duration: 7000
                    easing.type: Easing.InOutQuad
                }
                XAnimator{
                    target: screen
                    from: 800
                    to: 100
                    duration: 8000
                    easing.type: Easing.OutBounce
                }

                ColorAnimation {
                    target: screen
                    from: "blue"
                    to: "orange"
                    duration: 8000
                }

                NumberAnimation {
                    target: bille
                    property: "x"
                    from: 0
                    to: 400
                    duration: 7000
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    target: start
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 5000
                    easing.type: Easing.InOutQuad
                }

                NumberAnimation {
                    target: instruction
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 5000
                    easing.type: Easing.InOutQuad
                }
                NumberAnimation {
                    target: instruct
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 5000
                    easing.type: Easing.InOutQuad
                }
            }
        ]
       states: [
            State {
                name: "normal"
                PropertyChanges {
                    target: wrapper
                    width: parent.width
                    height: parent.height
                }
                PropertyChanges {
                    target: instruct
                    visible: false
                }
                PropertyChanges {
                    target: game
                    visible: false
                }
            },
            State {
                name: "expanded"
                PropertyChanges {
                    target: wrapper
                    opacity: 0.5
                }
                PropertyChanges {
                    target: instruct
                    visible : true
                    opacity: 0
                }
                PropertyChanges {
                    target: but
                    visible : true
                    opacity: 1
                }
                PropertyChanges {
                    target: instruct
                    visible : true
                }
                PropertyChanges {
                    target: game
                    visible: false
                }
                PropertyChanges {
                    target: timo
                    running: true
                }
            },
            State {
                name: "play"
                PropertyChanges {
                    target: wrapper
                    visible: false
                }
                PropertyChanges {
                    target: instruct
                    visible : false
                }
                PropertyChanges {
                    target: game
                    visible: true
                }
            },
           State {
               name: "expanded2"
                   PropertyChanges {
                       target: instruct
                       opacity: 1
                   }
                   PropertyChanges {
                       target: game
                       visible: false
                   }
                   PropertyChanges {
                       target: timo
                       interval: 15000
                       running: true
                       repeat: false
                       onTriggered: wrapper.state = "game1"
                   }
               },
           State {
               name: "game1"
               PropertyChanges {
                   target: instruct
                   opacity: 0
               }
               PropertyChanges {
                   target: game
                   visible: false
               }
               PropertyChanges {
                   target: start
                   opacity: 0
               }
               PropertyChanges {
                   target: instruction
                   opacity: 0
               }
               PropertyChanges {
                   target: bille
                   running: true
                   visible: true
               }
               PropertyChanges {
                   target: screen
                   visible: true

               }
           }
            ]
       ColumnLayout{
           Image {
               id: anagramme
               source: "Images/anagramme.png"
           }
           Image {
               id: by
               source: "Images/by.png"
               anchors.top: anagramme.bottom
               anchors.horizontalCenter: anagramme.horizontalCenter
           }
           Image {
               id: frankenstein
               source: "Images/frankenstein.png"
               anchors.top: by.bottom

           }

       }
        Timer{
            id :timo
            interval: 15000
            running: false
            repeat: true
//            time.text = Date().toString()
            onTriggered: wrapper.state = "expanded2"
        }

       Direction {
           id : start
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 40
           anchors.left : parent.left
           anchors.leftMargin: 300
           onClicked:{

               wrapper.state = wrapper.state == "normal" || wrapper.state == "expanded" || wrapper.state == "expanded2"  ? "play" : wrapper.state
               console.log(" " + wrapper.state)
           }
       }
       Direction{
           id: instruction
           text: qsTr("Instructions")
           anchors.left: start.right
           anchors.leftMargin: 60
           anchors.bottom: parent.bottom
           anchors.bottomMargin: 40
           onClicked: wrapper.state = wrapper.state == "normal" ? "expanded" : "normal"
       }
    }
    Instruct{
        id: but
        visible: false
        width: parent.width/3
        height: parent.height/2
        anchors.centerIn: parent
        transformOrigin: Item.Center
    }
    Instruct{
        id: instruct
//        visible: false
        width: parent.width/3 + 30
        height: parent.height/2 +15
        anchors.centerIn: parent
        text: qsTr("<h1>Instructions</h1><br><br>

                    -Trouve le mot de l'animation en fond d'ecran avant les 100prochains coups et gagne 100points<br><br>
                    -Si tu ne veux pas du premier challenge appuie sur directement sur Debuter suis sur play<br><br>
                    -Pour chaque partie tu as 8 lettres au hasard de l'alphabet et de ces lettres tu formeras ton plus long mot possible<br><br>
                    -Tu as droit à 4essais<br><br>
                    -Le nombre de lettre du mot sera multiplié par deux et fera ton nombre de point à la fin de la partie")
    }

    Bille{
        id : bille
        running: false
        visible: false
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
    }
    Scan{
        objectName: "scan"
        id: screen
        visible: false
        anchors.centerIn: parent
    }
}
