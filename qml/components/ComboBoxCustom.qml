import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import Qt5Compat.GraphicalEffects
import "../../js/support/MaterialFont.js" as MaterialFont

//https://doc-snapshots.qt.io/qt5-5.12/qtquickcontrols2-customize.html#customizing-combobox
ComboBox {
    id: control

    property string backgroundColor: Qt.rgba(0, 0, 0, 0)
    property string textColor: "#FFFFFF"
    property string optionsTextColor: "#000000"
    property real popupWidth: 200
    //model: model

    font {
        family: "Oxygen"
        pixelSize: 16
    }

    delegate: ItemDelegate {
        width: control.popupWidth
        contentItem: Text {
            text: modelData
            color: control.optionsTextColor
            font: control.font
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
        }
        //highlighted: control.highlightedIndex === index
    }

    indicator: Text {
        x: control.width - width - control.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2 + 2
        text: MaterialFont.icons.keyboard_arrow_down
        color: control.textColor
        font {
            family: "MaterialIcons"
            pixelSize: 22
        }
    }



    contentItem: Text {
        leftPadding: 0
        rightPadding: control.indicator.width + control.spacing

        text: control.displayText
        font: control.font
        color: control.textColor //control.pressed ? "#17a81a" : "#21be2b"
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 40
        //border.color: control.pressed ? "#17a81a" : "#21be2b"
        //border.width: control.visualFocus ? 2 : 1
        //radius: 2
        color: control.backgroundColor
    }

    popup: Popup {
        y: control.topPadding //+ control.availableHeight/2
        width: control.popupWidth
        implicitHeight: contentItem.implicitHeight
        padding: 1

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.popup.visible ? control.delegateModel : null
            currentIndex: control.highlightedIndex

            ScrollIndicator.vertical: ScrollIndicator { }
        }

        background: Rectangle {
            //border.color: "#21be2b"
            //radius: 2
            width: control.popupWidth

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
