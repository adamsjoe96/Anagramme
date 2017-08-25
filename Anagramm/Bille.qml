import QtQuick 2.0
import QtQuick 2.7

Item{
    id: item
    property alias running: anim.running
    state: "right_down"
    Image {
            id: pole1
            height: 80
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "Images/pole.png"
            Billeau{
                id: bi1
                x: -width/2 + 4
                anchors.top: parent.bottom
            }
        }
        Image{
            id: pole2
            height: 80
//            x: bi1.width/2
            anchors.right: pole1.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            source: "Images/pole.png"
            Billeau{
                id: bi2
                x: -width/2 + 4
//                y: parent.y +parent.height
                anchors.top: parent.bottom
//                anchors.right: parent.right
            }
        }
        Image{
            id: pole3
            height: 80
            anchors.right: pole2.left
            anchors.rightMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            source: "Images/pole.png"
            transformOrigin: Item.Top
            /*transform: Rotation{
                angle: 45
            }*/
            Billeau{
                id: bi3
                x: -width/2 + 4
                anchors.top: parent.bottom
            }
        }
        Image{
            id: pole4
            height: 80
            anchors.left: pole1.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            source: "Images/pole.png"
            transformOrigin: Item.Top
            Billeau{
                id: bi4
                x: -width/2 + 4
                anchors.top: parent.bottom
            }
        }
       states: [
            State {
                name: "right_up"
                PropertyChanges {
                    target: pole4
                    rotation: -45
                }
            },
           State{
               name: "right_down"
               PropertyChanges {
                   target: pole4
                   rotation: 0
               }
           },
           State {
               name: "left_up"
               PropertyChanges {
                   target: pole3
                   rotation: 45
               }
           },
           State {
               name: "left_down"
               PropertyChanges {
                   target: pole3
                   rotation: 0
               }
           }

        ]
       transitions: [
           Transition {
               from: "right_up"
               to: "right_down"
               reversible: true
               RotationAnimator{
                   target: pole4
                   to: 0
                   duration: 1000
                   easing.type: Easing.InQuad                   }

           },
           Transition {
                            from: "right_down"
                            to: "left_down"
                            reversible: true
                            NumberAnimation{
                                duration: 200
                            }
            },
           Transition {
               from: "left_down"
               to: "left_up"
               reversible: true
               RotationAnimator{
                   target: pole3
                   to: 45
                   duration: 1000
                   easing.type: Easing.OutQuad
               }

           }
       ]
       function stateChangement()
       {
           if(item.state === "right_up")
           {
               item.state ="right_down"
           }
           else if (item.state === "right_down")
               item.state = "left_down"
           else if(item.state === "left_down")
               item.state= "left_up"
       //        else
       //            item.state = "left_down"
       }
       function stateChange()
       {
               if (controll.position===1.0)
                   anim.running = true;
               else
                   anim.running = false
       }
    SequentialAnimation{
    id:anim
    loops: Animation.Infinite
    running: true
    RotationAnimator{
        target: pole4
        from: -45
        to: 0
        duration: 800
        easing.type: Easing.InQuad
    }
    RotationAnimator{
        target: pole3
        from: 0
        to: 45
        duration: 800
        easing.type: Easing.OutQuad
    }
    RotationAnimator{
        target: pole3
        from: 45
        to: 0
        duration: 800
        easing.type: Easing.InQuad
    }
    RotationAnimator{
        target: pole4
        from: 0
        to: -45
        duration: 800
        easing.type: Easing.OutQuad
        }

     }
}
