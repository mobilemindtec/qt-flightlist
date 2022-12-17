import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Item {

    property alias label: textData.text
    property alias icon: iconData.iconName
    property bool selected: false
    signal clicked(variant mouse)

    ColumnLayout {
        anchors.fill: parent
        anchors.centerIn: parent
        Icon {
            id: iconData
            color: selected ? "#F47D15" : Qt.rgba(0, 0, 0, .7)
            Layout.alignment: Qt.AlignHCenter
            pixelSize: 24
        }
        TextNormal {
            id: textData
            color: selected ? "#F47D15" : Qt.rgba(0, 0, 0, .7)
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: 14
        }

    }
    MouseArea {
        anchors.fill: parent
        onClicked: { parent.clicked(mouse) }
    }
}
