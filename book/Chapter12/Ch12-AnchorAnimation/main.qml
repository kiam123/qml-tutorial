
import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: rootItem
    width: 360
    height: 240
    visible: true
    color: "#EEEEEE"

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
        color:  "red";
        width: 200;
        height: 200;
        anchors.leftMargin: 10;

        MouseArea {
            id: mouseArea
            anchors.fill: parent;
            onClicked: {
                if(redRect.state == "" || redRect.state == "default") {
                    redRect.state = "reanchor";
                } else {
                    redRect.state = "default";
                }
            }
        }

        states: [
            State {
                name: "reanchor";
                changes: [
                    AnchorChanges {
                        target: redRect;
                        anchors.top: blueRect.bottom;
                        anchors.left: rootItem.left;
                    },
                    PropertyChanges {
                        target: redRect;
                        height: 40;
                        anchors.topMargin: 4;
                    }

                ]
            },
            State {
                name: "default";
                AnchorChanges {
                    target: redRect;
                    anchors.left: blueRect.right;
                    anchors.top: blueRect.top;
                }
            }

        ]

        state: "default";

        transitions: Transition {
            AnchorAnimation {
                duration: 1000;
                easing.type: Easing.OutInCubic;
            }
        }
    }
}
