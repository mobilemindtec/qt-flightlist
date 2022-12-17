import QtQuick 2.15
import QtQuick.Controls 2.15
import Qt5Compat.GraphicalEffects

Text {
    color: "#FFFFFF"
    font {
        family: "Oxygen"
        pixelSize: 16
        styleName: Font.Normal

    }

    //layer.enabled: true
    //layer.effect: DropShadow {
    //    verticalOffset: 0
    //    color: parent.color
    //    radius: 1
    //    samples: 9
    //}

    AppFontLoader {
        id: fonts
    }

}
