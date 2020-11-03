import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    color: "#EEEEEE";
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
        focus: true;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        source: "ColorPicker.qml";
        KeyNavigation.right: blueLoader;
        KeyNavigation.tab: blueLoader;

        onLoaded: {
            item.color = "red";
            item.focus = true;
        }

        onFocusChanged: {
            item.focus = focus;
        }
    }

    //當畫面時建立一個colorComponent然後設定redLoader右邊
    Loader {
        id: blueLoader;
        anchors.left: redLoader.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        source: "ColorPicker.qml";
        KeyNavigation.right: blueLoader;
        KeyNavigation.tab: blueLoader;

        onLoaded: {
            item.color = "blue";
        }

        onFocusChanged: {
            item.focus = focus;
        }
    }

    Connections {
        target: redLoader.item;
        onColorPicked: {
            colorText.color = clr;
            if(!redLoader.focus) {
                redLoader.focus = true;
                blueLoader.focus = false;
            }
        }
    }

    Connections {
        target: blueLoader.item;
        onColorPicked: {
            colorText.color = clr;
            if(!blueLoader.focus) {
                blueLoader.focus = true;
                redLoader.focus = false;
            }
        }
    }
}
