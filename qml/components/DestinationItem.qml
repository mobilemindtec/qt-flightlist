import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects


ColumnLayout {
    width: 150;

    property alias source: img.source
    property alias text: textCity.text
    property alias price: txtPrice.text
    property alias oldPrice: txtOldPrice.text
    property alias discount: txtDiscount.text
    property alias date: txtDate.text

    Item {
        width: parent.width
        height: parent.height - 20
        layer.enabled: true
        layer.effect: OpacityMask {
            //source: img
            maskSource: mask
        }

        Rectangle {
           id: mask
           anchors.fill: parent
           radius: 10
        }

        Image {
            id: img
            //width: sourceSize.width * 1.3
            //height: sourceSize.height* 1.3
            anchors.fill: mask
            fillMode: Image.PreserveAspectCrop
            smooth: true
        }

        Rectangle {
           anchors.fill: parent
           color: Qt.rgba(0, 0, 0, .3)
           radius: 10
        }

        ColumnLayout {
            width: parent.width; height: 70
            anchors.bottom: parent.bottom
            spacing: 0

            TextBold {
                Layout.leftMargin: 15
                id: textCity
                //text: "Athens"
                color: "#FFFFFF"
                font.pixelSize: 18
            }

            RowLayout {
                width: parent.width; height: 25
                Layout.leftMargin: 15
                Layout.rightMargin: 15
                Layout.bottomMargin: 10
                TextNormal {
                    id: txtDate
                    font.pixelSize: 14
                    Layout.fillWidth: parent
                }
                Rectangle {
                    height: 25; width: 45
                    color: "#FFFFFF"
                    radius: 20
                    Layout.alignment: Qt.AlignRight

                    TextBold {
                        id: txtDiscount
                        font.pixelSize: 15
                        color: "#000000"
                        anchors.centerIn: parent
                    }
                }
            }
        }
    }
    RowLayout {
        width: parent.width
        height: 20
        Layout.leftMargin: 15
        Layout.rightMargin: 15
        TextNormal {
            id: txtPrice
            color: Qt.rgba(0, 0, 0, 1)
        }
        TextNormal {
            id: txtOldPrice
            color: Qt.rgba(0, 0, 0, 0.4)
            font.strikeout: true
            Layout.leftMargin: 5
        }
    }
}
