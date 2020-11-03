import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 320
    height: 240
    visible: true
    color: "#EEEEEE";
    title: qsTr("Hello World")

    Text {
        id: coloredText;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 4;
        text: "Hellow World";
        font.pixelSize: 32;
    }

    function setTextColor(clr) {
        coloredText.color = clr;
    }

    ColorPicker {
        id: redColor;
        color: "red";
        focus: true;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        KeyNavigation.right: blueColor;
        KeyNavigation.tab: blueColor;
        onColorPicked: {
            coloredText.color = clr;
        }
    }

    ColorPicker {
        id: blueColor;
        color: "blue";
        anchors.left: redColor.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        KeyNavigation.left: redColor;
        KeyNavigation.right: pinkColor;
        KeyNavigation.tab: pinkColor;
    }

    ColorPicker {
        id: pinkColor;
        color: "pink";
        anchors.left: blueColor.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;

        KeyNavigation.right: blueColor;
        KeyNavigation.tab: redColor;
    }

    Component.onCompleted: {
        blueColor.colorPicked.connect(setTextColor);
        pinkColor.colorPicked.connect(setTextColor);
    }
}
