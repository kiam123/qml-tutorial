import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rect;
        color: "gray";
        width: 50;
        height: 50;
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
        }

        states: State {
            name: "pressed";
            when: mouseArea.pressed;
            PropertyChanges {
                target: rect;
                color: "green";
                scale: "2.0";
            }
        }

        transitions:  Transition {
            NumberAnimation {
                property: "scale";
                easing.type: Easing.InOutQuad;
                duration: 1000;
            }
            ColorAnimation {
                duration: 600;
            }
        }
    }
}
