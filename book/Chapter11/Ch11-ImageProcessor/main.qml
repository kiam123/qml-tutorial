import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 1.1
import QtQuick.Dialogs 1.1
import an.qt.ImageProcessor 1.0
import QtQuick.Controls.Styles 1.1


Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "#121212";
    property var imgSource: ""

    BusyIndicator {
        id: busy;
        running: false;
        anchors.centerIn: parent;
        z: 2;
    }

    Label {
        id: stateLabel;
        visible: false;
        anchors.centerIn: parent;
    }

    Image {
        objectName: "imageViewer";
        id: imageViewer;
        asynchronous: true;
        anchors.fill: parent;
//        source: "qrc:/new/prefix1/meinv.jpg";
        fillMode: Image.PreserveAspectFit;
        onStatusChanged: {
            if (imageViewer.status === Image.Loading) {
                busy.running = true;
                stateLabel.visible = false;
            }
            else if(imageViewer.status === Image.Ready) {
                busy.running = false;
            }
            else if(imageViewer.status === Image.Error) {
                busy.running = false;
                stateLabel.visible = true;
                stateLabel.text = "ERROR";
            }
        }
    }

    ImageProcessor {
        id: processor;
        onFinished: {
            console.log("ImageProcessor......"+newFile);
            imageViewer.source = "file:///" +newFile;
//            imageViewer.source = +newFile;
        }
    }

    FileDialog {
        id: fileDialog;
        title: "Please choose a file";
        nameFilters: ["Image Files (*.jpg *.png *.gif)"];
        onAccepted: {
            console.log("fileDialog.fileUrl:  "+fileDialog.fileUrl);
            imageViewer.source = fileDialog.fileUrl;
        }
    }

    Component{
        id: btnStyle;
        ButtonStyle {
            background: Rectangle {
                implicitWidth: 70
                implicitHeight: 25
                border.width: control.pressed ? 2 : 1
                border.color: (control.pressed || control.hovered) ? "#00A060" : "#888888"
                radius: 6
                gradient: Gradient {
                    GradientStop { position: 0 ; color: control.pressed ? "#cccccc" : "#e0e0e0" }
                    GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                }
            }
        }
    }

    Button {
        id: openFile;
        text: "打开";
        anchors.left:  parent.left;
        anchors.leftMargin: 6;
        anchors.top: parent.top;
        anchors.topMargin: 6;
        onClicked: {
            fileDialog.visible = true;
        }
        style: btnStyle;
        z: 1;
    }

    Button {
        id: quit;
        text: "退出";
        anchors.left: openFile.right;
        anchors.leftMargin: 4;
        anchors.bottom: openFile.bottom;
        onClicked: {
            Qt.quit()
        }
        style: btnStyle;
        z: 1;
    }

    Rectangle {
        anchors.left: parent.left;
        anchors.top: parent.top;
        anchors.bottom: openFile.bottom;
        anchors.bottomMargin: -6;
        anchors.right: quit.right;
        anchors.rightMargin: -6;
        color: "#404040";
        opacity: 0.7;
    }
    Grid {
        id: op;
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.bottom: parent.bottom;
        anchors.bottomMargin: 4;
        rows: 2;
        columns: 3;
        rowSpacing: 4;
        columnSpacing: 4;
        z: 1;

        Button {
            text: "柔化";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                console.log("file:     "+fileDialog.fileUrl);
//                processor.process(":/new/prefix1/meinv.jpg", ImageProcessor.Soften);
                    processor.process(fileDialog.fileUrl, ImageProcessor.Soften);
            }
        }

        Button {
            text: "灰度";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Gray);
//                processor.process(":/new/prefix1/meinv.jpg", ImageProcessor.Gray);
            }
        }

        Button {
            text: "浮雕";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Emboss);
//                processor.process(":/new/prefix1/meinv.jpg", ImageProcessor.Emboss);
            }
        }
        Button {
            text: "黑白";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Binarize);
//                processor.process(":/new/prefix1/meinv.jpg", ImageProcessor.Binarize);
            }
        }

        Button {
            text: "底片";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor.Negative);
//                processor.process(":/new/prefix1/meinv.jpg", ImageProcessor.Negative);
            }
        }

        Button {
            text: "锐化";
            style: btnStyle;
            onClicked: {
                busy.running = true;
                processor.process(fileDialog.fileUrl, ImageProcessor._soften);
//                processor.process(":/new/prefix1/meinv.jpg", ImageProcessor._soften);
            }
        }
    }

    Rectangle {
        anchors.left: parent.left;
        anchors.top: op.top;
        anchors.topMargin: -4;
        anchors.bottom: parent.bottom;
        anchors.right: op.right;
        anchors.rightMargin: -4;
        color: "#404040";
        opacity: 0.7;
    }

}
