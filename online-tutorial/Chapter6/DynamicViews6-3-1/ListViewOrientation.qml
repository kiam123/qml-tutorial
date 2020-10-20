import QtQuick 2.0

Rectangle {
    width: 480
    height: 80

    color: "white"

    ListView {
        anchors.fill: parent
        anchors.margins: 20

        clip: true

        model: 100

        orientation: ListView.Horizontal

        delegate: numberDelegate
        spacing: 5
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
