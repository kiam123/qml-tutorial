import QtQuick 2.0

Rectangle {
    width: 80
    height: 300

    color: "white"

    ListView {
        anchors.fill: parent
        anchors.margins: 20

        clip: true

        model: 4

        delegate: numberDelegate
        spacing: 5

        header: headerComponent
        footer: footerComponent
    }

    Component {
        id: headerComponent

        Rectangle {
            width: 40
            height: 20

            color: "yellow"
        }
    }

    Component {
        id: footerComponent

        Rectangle {
            width: 40
            height: 20

            color: "red"
        }
    }

    Component {
        id: numberDelegate

        Rectangle {
            width: 40
            height: 40

            color: "lightGreen"

            Text {
                anchors.centerIn: parent

                font.pixelSize: 10

                text: index
            }
        }
    }
}
