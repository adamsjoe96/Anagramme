import QtQuick 2.0
import QtQuick 2.7


/*property alias tox1: xnum1.to
property alias toy1: ynum1.to
property alias toangle1 : angle1.to
property alias tox2 : xnum2.to
property alias toy2 : ynum2.to
property alias toangle2: angle2.to*/


Row{
    visible: true
    Image {
        id: a
        source: "Images/a.png"
        Animationen{
            cible: a
            tox2: 700
            toy2: 100
            time : 3500
        }
    }
    Image {
        id: r
        source: "Images/r.png"
        Animationen{
            cible: r
            time: 2400
        }
    }
    Image {
        id: f
        source: "Images/f.png"
        Animationen{
            cible: f
            time: 6000
        }
    }
    Image {
        id: e
        source: "Images/e.png"
        Animationen{
            cible: e
            time: 3000
        }
    }
    Image {
        id: r2
        source: "Images/r.png"
        Animationen{
            cible: r2
            time : 7000
        }
    }
    Image {
        id: n
        source: "Images/n.png"
        Animationen{
            cible: n
            time: 6700
        }
    }
    Image {
        id: k
        source: "Images/k.png"
        Animationen{
            cible: k
            time: 4500
            tox1: 450
            tox2: 50
            toy2: 250
        }
    }
    Image {
        id: n2
        source: "Images/n.png"
        Animationen{
            cible: n2
            time: 4200
            tox1: 600
            tox2: 15
            toy2: 300
        }
    }
    Image {
        id: d
        source: "Images/d.png"
        Animationen{
            cible: d
        }
    }
    Image {
        id: n3
        source: "Images/n.png"
        Animationen{
            cible: n3
        }
    }
    Image {
        id: s
        source: "Images/s.png"
        Animationen{
            cible: s
        }
    }
    Image {
        id: t
        source: "Images/t.png"
        Animationen{
            cible: t
            time: 8000
        }
    }
    Image {
        id: e2
        source: "Images/e.png"
        Animationen{
            cible: e2
            time: 5396
        }
    }
    Image {
        id: i
        source: "Images/i.png"
        Animationen{
            cible: i
            time: 3658
        }
    }
}
