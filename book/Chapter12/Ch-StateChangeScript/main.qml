import QtQuick 2.12
import QtQuick.Window 2.12
import "colorMaker.js" as ColorMaker

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: colorRect;
        color: "red"
        width: 150;
        height: 130;
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
        }

        states: [
            State {
                name: "default";
                when: mouseArea.pressed;
                StateChangeScript {
                    name: "changeColor";
                    script:
                        ColorMaker.changeColor(colorRect);
                }
            }

        ]
    }
}
