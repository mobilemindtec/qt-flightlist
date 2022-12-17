import QtQuick 2.15
import "../../js/support/MaterialFont.js" as MaterialFont

Item {
    height: 20; width: 20
    property alias pixelSize: textItem.font.pixelSize
    property alias color: textItem.color
    property string iconName
    property string icon
    Text {
        id: textItem
        text: {
            if(icon)
                return icon
            if(iconName)
                return MaterialFont.icons[iconName]
            return ""
        }
        color: "#FFFFFF"
        font {
            family: "MaterialIcons"
            pixelSize: 20
        }
    }
    AppFontLoader {
        id: fonts
    }
}

