import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 320
    height: 240
    visible: true
    color: "#c0c0c0";
    title: qsTr("Hello World")

    Text {
        id: colorText;
        anchors.horizontalCenter: parent.horizontalCenter;
        anchors.top: parent.top;
        anchors.topMargin: 4;
        text: "Hello world!";
        font.pixelSize: 32;
    }

    //Component是一個Class需要被宣告才會實例化
    Component {
        id: colorComponent;
        Rectangle {
            id: colorPicker;
            width: 50;
            height: 30;
            signal colorPicked(color clr);
            MouseArea {
                anchors.fill: parent;
                onPressed: colorPicker.colorPicked(colorPicker.color);
            }
        }
    }

    //當畫面時建立一個colorComponent
    Loader {
        id: redLoader;
        width: 80;
        height: 60;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        sourceComponent: colorComponent;
        onLoaded: {
            item.color = "red";
        }
    }

    //當畫面時建立一個colorComponent然後設定redLoader右邊
    Loader {
        id: blueLoader;
        anchors.left: redLoader.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        sourceComponent: colorComponent;
        onLoaded: {
            item.color = "blue";
        }
    }

    Connections {
        target: redLoader.item;
        onColorPicked: {
            colorText.color = clr;
        }
    }

    Connections {
        target: blueLoader.item;
        onColorPicked: {
            colorText.color = clr;
        }
    }
}
