import QtQuick 2.15

Item {

    property alias oxygenBold: oxygenBold
    property alias oxygenRegular: oxygenRegular
    property alias icons: icons

    FontLoader {
       id: oxygenBold
       source: "../../assets/fonts/Oxygen-Bold.ttf"
       onStatusChanged: console.log("icons = " + oxygenBold.name)
    }

    FontLoader {
       id: oxygenRegular
       source: "../../assets/fonts/Oxygen-Regular.ttf"
       onStatusChanged: console.log("icons = " + oxygenRegular.name)
    }

    FontLoader {
       id: icons
       source: "../../assets/fonts/MaterialIcons-Regular.ttf"
       onStatusChanged: console.log("icons = " + icons.name)
    }
}

