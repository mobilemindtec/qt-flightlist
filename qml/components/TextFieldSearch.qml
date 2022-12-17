import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects

Item {
    height: 50

    TextField {
        anchors.fill: parent        
        placeholderText: qsTr("New York City (JFK)")
        placeholderTextColor: "#747d8c"
        verticalAlignment: TextInput.AlignVCenter
        font.pixelSize: 15
        font.family: "Oxygen"
        leftPadding: 20
        topPadding: 15
        background: Rectangle {
            anchors.fill: parent
            color: "white"
            radius: parent.height / 2
            opacity: 1
            layer.enabled: true            
            layer.effect: DropShadow {
                horizontalOffset: 1
                verticalOffset: 1
                radius: 5
                samples: 6
                color: Qt.rgba(0,0,0, 0.20)
            }
        }

        Rectangle{
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            height: parent.height
            width: parent.height
            radius: parent.height/2

            Icon {
                iconName: "search"
                anchors.centerIn: parent
                color: "#747d8c"
                pixelSize: 22
            }

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 1
                verticalOffset: 1
                radius: 5
                samples: 6
                color: Qt.rgba(0,0,0, 0.20)
            }
        }

    }

    AppFontLoader {
        id: fonts
    }
}
