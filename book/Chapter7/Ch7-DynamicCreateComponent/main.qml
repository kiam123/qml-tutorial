import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.2

Window {
    id: rootItem
    width: 360
    height: 300
    visible: true
    property var count: 0;
    property Component component: null;
    title: qsTr("Hello World")

    Text {
        id: colorText;
        text: "Hello world";
        anchors.centerIn: parent;
        font.pixelSize: 24;
    }

    function changeTextColor(clr) {
        coloredText.color = clr;
    }

    function createColorPicker(clr) {
        if(rootItem.component == null) {
//            var newObject = Qt.createQmlObject('import QtQuick 2.2;
//                Rectangle {color:"red"; width: 20; height:20}', parentItem,"dynamicSnippet1");
            rootItem.component = Qt.createComponent("ColorPicker.qml");
            rootItem.component = newObject;
        }
        var colorPicker;
        if(rootItem.component.status == Component.Ready) {
            colorPicker = rootItem.component.createObject(rootItem, {"color": clr, "x": rootItem.count * 55, "y": 10});
            colorPicker.colorPicked.connect(rootItem.changeTextColor);
        }
        rootItem.count++;
    }

    Button {
        id: add;
        text: "add";
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        onClicked: {
            createColorPicker(Qt.rgba(Math.random(), Math.random(), Math.random(), 1));
        }
    }
}
