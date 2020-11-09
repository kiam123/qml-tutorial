import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: rootItem
    width: 360
    height: 240
    visible: true
    color: "#EEEEEE";
    title: qsTr("Hello World")

    Rectangle {
        id: rect;
        color: "blue";
        width: 50;
        height: 50;
        x: 0;
        y: 95;

        MouseArea {
            anchors.fill: parent;
            onClicked: {
                animationX.start();
                animationXRotation.running = true;
                animationRadius.start();
            }

        }

        NumberAnimation {
            id: animationX;
            target: rect;
            property: "x";
            to: 310;
            duration: 3000;
            easing.type: Easing.OutCubic;
        }

        NumberAnimation {
            id: animationXRotation;
            target: rect;
            property: "rotation";
            to: 1080;
            duration: 3000;
            running: false;
            easing.type: Easing.OutInQuad;
        }

        NumberAnimation on radius{
            id: animationRadius;
            to: 25;
            duration: 3000;
            running: false;
        }
    }
}
