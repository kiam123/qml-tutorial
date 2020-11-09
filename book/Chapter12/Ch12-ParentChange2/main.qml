import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: rootItem
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: blueRect;
        width: 200;
        height: 200;
        color: "blue";
        x: 8;
        y: 8;
    }

    Rectangle {
        id: redRect;
        color: "red";
        width: 100;
        height: 100;
        x: blueRect.x + blueRect.width + 8;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: {
                if(redRect.state == "" || redRect.state == "default") {
                    redRect.state = "reparent";
                } else {
                    redRect.state = "default";
                }
            }
        }

        states: [
            State {
                name: "reparent";
                ParentChange {
                    target: redRect;
                    parent: blueRect;
                    width: 50;
                    height: 50;
                    x: 30;
                    y: 30;
                    rotation: 45;
                }
            },
            State {
                name: "default";
                ParentChange {
                    target: redRect;
                    parent: rootItem;
                    width: 100;
                    height: 100;
                    x: blueRect.x + blueRect.width + 8;
                    y: blueRect.y;
                    rotation: 60;
                }
            }


        ]
    }
}
