import QtQuick 2.0

Rectangle {
    width: 240
    height: 300

    color: "white"

    ListView {
        anchors.fill: parent
        anchors.margins: 20

        clip: true

        model: 100

        delegate: numberDelegate
        spacing: 5

        highlight: highlightComponent
        focus: true
    }

    //    Component {
    //        id: highlightComponent

    //        Rectangle {
    //            width: ListView.view.width
    //            color: "lightGreen"
    //        }
    //    }
    Component {
        id: highlightComponent

        Item {
            width: ListView.view.width
            height: ListView.view.currentItem.height

            y: ListView.view.currentItem.y

            Behavior on y {
                SequentialAnimation {
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 0; duration: 200 }
                    NumberAnimation { duration: 1 }
                    PropertyAnimation { target: highlightRectangle; property: "opacity"; to: 1; duration: 200 }
                }
            }

            Rectangle {
                id: highlightRectangle
                anchors.fill: parent
                color: "lightGreen"
            }
        }
    }

    Component {
        id: numberDelegate

        Item {
            width: 40
            height: 40

            Text {
                anchors.centerIn: parent

                font.pixelSize: 10

                text: index
            }
        }
    }
}
