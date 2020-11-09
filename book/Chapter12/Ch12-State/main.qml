import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        id: centerText;
        text: "A Single Text";
        anchors.centerIn: parent;
        font.pixelSize: 24;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onReleased: {
                centerText.state = "redText";
            }
        }

        states: [
            State {
                name: "blueText";
                when: mouseArea.pressed;
                PropertyChanges {
                    target: centerText;
                    color: "blue";
                    font.bold: true;
                    font.pixelSize: 32;
                }
            }

        ]

        state: "redText";
    }
}
