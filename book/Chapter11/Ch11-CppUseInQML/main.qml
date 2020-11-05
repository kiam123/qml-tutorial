import QtQuick 2.12
import QtQuick.Window 2.12
import an.qt.ColorMaker 1.0
import QtQuick.Controls 1.0

Window {
    width: 360
    height: 360
    visible: true
    title: qsTr("Hello World")

    Text {
        id: timeLabel;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.top: parent.top;
        anchors.topMargin: 4;
        font.pixelSize: 26;
    }

    ColorMaker {
        id: colorMaker;
        color: Qt.green;
    }

    Rectangle {
        id: colorRect;
        anchors.centerIn: parent;
        width: 200;
        height: 200;
        color: "blue";
    }

    Button {
        id: start;
        text: "start";
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        onClicked: {
            console.log("start: "+1);
            colorMaker.start();
        }
    }

    Button {
        id: stop;
        text: "stop";
        anchors.left: start.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        onClicked: {
            console.log("stop: "+1);
            colorMaker.stop();
        }
    }

    function changeAlgorithm(button, algorithm) {
        console.log("changeAlgorithm: "+algorithm);
        switch(algorithm) {
            case 0:
                button.text = "RandomRGB";
                break;
            case 1:
                button.text = "RandomRed";
                break;
            case 2:
                button.text = "RandomGreen";
                break;
            case 3:
                button.text = "RandomBlue";
                break;
            case 4:
                button.text = "LinearIncrease";
                break;
        }
    }

    Button {
        id: colorAlgorithm;
        text: "RandomRFG";
        anchors.left: stop.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        onClicked: {
            var algorithm = (colorMaker.algorithm() + 1) % 5;
            console.log("algorithm: "+algorithm);

            changeAlgorithm(colorAlgorithm, algorithm);
            colorMaker.setAlgorithm(algorithm);
        }
    }

    Button {
        id: quit;
        text: "quit";
        anchors.left: colorAlgorithm.right;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        onClicked: {
            Qt.quit();
        }
    }

    Component.onCompleted: {
        console.log("colorMaker.color: "+colorMaker.algorithm());
        colorMaker.color = Qt.rgba(0, 180, 120, 255);
        console.log("LinearIncrease: run");
        colorMaker.setAlgorithm(colorMaker.LinearIncrease);
        console.log("changeAlgorithm: run");
        changeAlgorithm(colorAlgorithm, colorMaker.algorithm());
    }

    Connections {
        target: colorMaker;
        function onCurrentTime(strTime) {
            console.log("timeLabel.text: run");
            timeLabel.text = strTime;
            console.log("timeLabel.color: run");
            timeLabel.color = colorMaker.timeColor;
        }
    }

    Connections {
        target: colorMaker;
        function onColorChanged(color) {
            console.log("onColorChanged: "+color)
            colorRect.color = color;
            console.log("onColorChanged: "+colorRect.color)
        }
    }
}
