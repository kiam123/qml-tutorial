import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        id: linkText;
        text: "I\'m web link.";
        anchors.centerIn: parent;
        font.pixelSize: 24;
        property var hadClicked: false;

        MouseArea {
            id: mouseArea;
            anchors.fill: parent;
            hoverEnabled: true;

            onEntered: {
                linkText.state = linkText.hadClicked == true? "clickedHover" : "hover";
            }
            onExited: {
                linkText.state = linkText.hadClicked == true? "clicked" : "initial";
            }
            onClicked: {
                if(linkText.hadClicked == false) {
                    linkText.hadClicked = false;
                }
                linkText.state = "clicked";
            }
        }

        states: [
            State {
                name: "initial"
                changes: [
                    PropertyChanges {
                        target: linkText;
                        color: "blue";
                    }
                ]
            },
            State {
                name: "hover";
                PropertyChanges {
                    target: linkText;
                    color: "#8B4513";
                    font {
                        italic: true;
                        pixelSize: 36;
                        underline: true;
                    }
                }
            },
            State {
                name: "clicked";
                PropertyChanges {
                    target: linkText;
                    color: "#8B4513";
                    font {
                        pixelSize: 24;
                    }
                }
            },
            State {
                name: "clickedHover";
                PropertyChanges {
                    target: linkText;
                    color: "#D2691E";
                    font {
                        italic: true;
                        pixelSize: 26;
                        underline: true;
                    }
                }
            }
        ]

        state: "initial";

        transitions: [
            Transition {
                from: "initial";
                to: "hover";
                reversible: true;
                NumberAnimation {
                    property: "font.pixelSize";
                    duration: 800;
                }
                ColorAnimation {
                    duration: 800;
                }
            },
            Transition {
                from: "hover";
                to: "clicked";
                NumberAnimation {
                    property: "font.pixelSize";
                    duration: 800;
                }
                ColorAnimation {
                    duration: 800;
                }
            },
            Transition {
                from: "clicked";
                to: "clickedHover";
                reversible: true;
                SequentialAnimation {
                    NumberAnimation {
                        property: "font.pixelSize";
                        duration: 800;
                    }
                    ColorAnimation {
                        duration: 800;
                    }
                }
            }
        ]
    }




}
