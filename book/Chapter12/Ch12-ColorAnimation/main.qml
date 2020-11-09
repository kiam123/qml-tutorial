import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 320
    height: 240
    visible: true
    title: qsTr("Hello World")
    color: "#EEEEEE"

    Rectangle {
        id: react;
        color: "red";
        width: 60;
        height: 60;
        radius: 30;
        anchors.centerIn: parent;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            onClicked: ColorAnimation {
                target: react;
                property: "color";
                to: "green";
                duration: 1500;
            }
        }
    }
}
