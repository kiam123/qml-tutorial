import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rect;
        color: "blue";
        width: 50;
        height: 50;
        x: 0;
        y: 95;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                if(anim.paused) {
                    anim.resume();
                } else if(anim.running) {
                    anim.pause();
                } else {
                    anim.start()
                }
            }
        }

        ParallelAnimation {
            id: anim;
            loops: Animation.Infinite;
            NumberAnimation {
                target: rect;
                property: "x";
                to: 310;
                duration: 3000;
            }
            NumberAnimation {
                target: rect;
                property: "rotation";
                to: 360;
                duration: 1000;
                loops: 3;
            }
            NumberAnimation {
                target: rect;
                property: "radius";
                to: 25;
                duration: 3000;
            }
        }
    }
}
