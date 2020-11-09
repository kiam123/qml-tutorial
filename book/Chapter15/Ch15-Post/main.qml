import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.2

Window {
    id: root;
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "black";

    property var xmlhttp: null;

    function onResultReady() {
        if(xmlhttp.readySate == 4) {
            console.log("Status Code: ", xmlhttp.status);
            xmlhttp.abort();
        }
    }
    function post() {
        if(xmlhttp == null) {
            xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadstatechange = onResultReady();
        }
        if(xmlhttp.readyState == 0) {
            xmlhttp.open("POST", "http://127.0.0.1:8081/t");
            xmlhttp.send("test post");
        }
    }

    Button {
        anchors.centerIn: parent;
        text: "Send";
        onClicked: root.post();
    }
}
