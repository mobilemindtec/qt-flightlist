import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

Rectangle {
     width: 100
     radius: 19


     property alias text: label.text
     property alias iconName: icon.iconName
     signal clicked(variant mouse)

     RowLayout {
         width: parent.width
         height: parent.height

         Icon {
             id: icon
             Layout.alignment: Qt.AlignCenter
             Layout.leftMargin: 8
         }

         TextNormal {
             id: label
         }
     }

     MouseArea {
         id: mauseArea
         anchors.fill: parent
         onClicked: (mouse) => { parent.clicked(mouse) }
     }
}
