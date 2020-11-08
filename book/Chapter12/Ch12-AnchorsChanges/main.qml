import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: rootItem;
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: blueRect;
        width: 200;
        height: 180;
        color: "blue";
        x: 8;
        y: 8;
    }

    Rectangle {
        id: redRect;
        color: "red";
        width: 100;
        height: 100;
        anchors.left: blueRect.right;
        anchors.leftMargin: 10;
        anchors.top: blueRect.top;

        MouseArea {
            id: mouseArea;
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
                        anchors.left: blueRect.left;
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
    }
}
