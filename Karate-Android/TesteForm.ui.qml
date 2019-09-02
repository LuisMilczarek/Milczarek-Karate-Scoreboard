import QtQuick 2.4
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.3

Item {
    width: 400
    height: 800

    Rectangle {
        id: rectangle
        color: "#ffffff"
        anchors.fill: parent

        ColumnLayout {
            id: columnLayout
            anchors.fill: parent

            Text {
                id: element
                text: qsTr("Text")
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                Layout.preferredHeight: 1
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                font.pixelSize: 400
            }

            RowLayout {
                id: rowLayout
                width: 100
                height: 100
                Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                Layout.fillWidth: true
                Layout.preferredHeight: 2
                Layout.fillHeight: true

                SpinBox {
                    id: spinBox
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignTop
                }

                SpinBox {
                    id: spinBox1
                    Layout.fillWidth: true
                }
            }

            Item {
                id: element1
                width: 200
                height: 200
            }
        }
    }
}
