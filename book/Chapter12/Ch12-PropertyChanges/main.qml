import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 360
    height: 240
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rect;
        color: "blue";
        width: 200;
        height: 200;
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
        }

        states: [
            State {
                name: "resetwidth";
                when: mouseArea.pressed;
                PropertyChanges {
                    target: rect;
                    restoreEntryValues: false;
                    color: "red";
                    width: parent.width;
                }
            }

        ]
    }
}
