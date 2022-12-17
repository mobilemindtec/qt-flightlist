import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Material 2.15
import Qt5Compat.GraphicalEffects
import QtQml.Models 2.15
import FlightList 1.0
//import QtQuick2FirebasePlugin 1.0
import "qrc:/qml/components"

ApplicationWindow {
    id: root
    width: ["ios", "android"].indexOf(Qt.platform.os) ? Screen.width : 380
    height: ["ios", "android"].indexOf(Qt.platform.os) ? Screen.height : 680
    visible: true
    title: qsTr("Flight List")

    Material.theme: Material.Light
    Material.accent: Material.Blue


    //Firebase {

    //}

    Rectangle{
        anchors.fill: parent
        color: "#FFFFFF"
    }

    //CustomClip {
    //    id: customClip
    //}

    ScrollView {
        anchors.fill: parent
        ScrollBar.horizontal.interactive: false
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
        contentWidth: root.width    // The important part
        contentHeight: column.height + 20 // Same
        clip : true

        ColumnLayout {
            id: column
            width: parent.width
            CanvasCustom {
                id: customClip
                width: root.width
                height: root.height * .55
                color: Qt.rgba(0, 0, 0, 0)

                ColumnLayout {
                    width: root.width
                    RowLayout {
                        width: root.width; height: 50
                        Layout.topMargin: 10
                        Layout.leftMargin: 10
                        Layout.rightMargin: 10
                        Item {
                            height: 50
                            Layout.fillWidth: root.width
                            RowLayout {
                                anchors.fill: parent
                                Icon { iconName: "location_on" }
                                ComboBoxCustom {
                                    //Layout.fillWidth: parent

                                    model: ["New York City (JFK)", "Boston (BOS)", "Califoria (CAF)", "Las Vegas (LAV)"]

                                    popupWidth: {
                                        var _maxWidth = 0
                                        for(var i = 0; i < model.length; i++){
                                            _maxWidth = Math.max(model[i].length * (Qt.application.font.pixelSize * .7), _maxWidth)
                                        }
                                        return  _maxWidth
                                    }
                                }
                            }
                        }

                        Icon { iconName: "settings" }
                    }

                    Item {
                        width: root.width; height: 80
                        Layout.alignment: Qt.AlignTop
                        Layout.topMargin: root.height *.02

                        TextBold {
                            text: qsTr("Where would\nyou want to go?")
                            font.pixelSize: 25
                            anchors.horizontalCenter: parent.horizontalCenter
                            horizontalAlignment: Text.AlignHCenter
                        }
                    }

                    TextFieldSearch {
                        width: root.width *.9                        
                        Layout.topMargin: 5
                        Layout.alignment: Qt.AlignCenter
                    }

                    RowLayout {
                        id: buttons
                        width: root.width; height: 34
                        Layout.topMargin: 20
                        Layout.alignment: Qt.AlignCenter

                        ChoiceChip {
                            id: btnFlights
                            Layout.fillHeight: parent
                            iconName: "flight_takeoff"
                            text: qsTr("Flights")
                            color: Qt.rgba(255, 255, 255, 0.2)
                            onClicked: buttons.state = "fligths"
                        }

                        ChoiceChip {
                           id: btnHotel
                           Layout.leftMargin: 11
                           Layout.fillHeight: parent
                           iconName: "hotel"
                           text: qsTr("Hotels")
                           color: Qt.rgba(255, 255, 255, 0)
                           onClicked: buttons.state = "hotel"
                        }

                        states: [
                           State {
                               name: "fligths"
                               PropertyChanges {
                                   target: btnFlights
                                   color: Qt.rgba(255, 255, 255, 0.2)
                               }
                               PropertyChanges {
                                   target: btnHotel
                                   color: Qt.rgba(255, 255, 255, 0)
                               }
                           },
                           State {
                               name: "hotel"
                               PropertyChanges {
                                   target: btnFlights
                                   color: Qt.rgba(255, 255, 255, 0)
                               }
                               PropertyChanges {
                                   target: btnHotel
                                   color: Qt.rgba(255, 255, 255, 0.2)
                               }
                           }
                       ]

                    }

                }

            }

            ColumnLayout {
                //anchors.top: customClip.bottom
                width: root.width
                spacing: 0
                RowLayout {
                    Layout.fillWidth: parent
                    height: 30

                    TextNormal{
                        Layout.leftMargin: 20
                        Layout.rightMargin: 20
                        text: "Currently Whatched Items"
                        color: "#000000"
                        font.pixelSize: 16
                    }

                    Item {
                        Layout.fillWidth: parent
                    }

                    TextNormal{
                        Layout.rightMargin: 20
                        Layout.topMargin: 5
                        text: "VIEW ALL (12)"
                        color: "#EF772C"
                        font.pixelSize: 14
                    }
                }

                RowLayout {
                    id: ds
                    Layout.fillWidth: parent; height: 230
                    Layout.rightMargin: 15
                    Layout.leftMargin: 15
                    Layout.topMargin: 20
                    spacing: 15

                    DelegateModel {
                        id: destinations
                        model: ListModel {
                            id: destinationsModel
                            ListElement {
                                source: "qrc:///assets/images/athens.jpg"
                                price: "$2,250"
                                oldPrice: "($4,299)"
                                date: "Feb 2019"
                                discount: "50%"
                                text: "Athens"
                            }
                            ListElement {
                                source: "qrc:///assets/images/lasvegas.jpg"
                                price: "$2,250"
                                oldPrice: "($4,299)"
                                date: "Apr 2019"
                                discount: "45%"
                                text: "Lasvegas"
                            }
                            ListElement {
                                source: "qrc:///assets/images/sydney.jpeg"
                                price: "$2,250"
                                oldPrice: "($4,299)"
                                date: "Nov 2019"
                                discount: "55%"
                                text: "Sydney"
                            }
                        }
                        delegate:  DestinationItem {
                            height: parent.height
                            source: model.source
                            price: model.price
                            oldPrice: model.oldPrice
                            date: model.date
                            discount: model.discount
                            text: model.text

                        }
                    }

                    ListView {
                        spacing: 10
                        Layout.fillHeight: parent
                        Layout.fillWidth: parent
                        model: destinations
                        orientation: ListView.Horizontal
                    }


                }
            }
        }
    }



    footer: Item {
        width: root.width
        height: 60

        Rectangle {
            anchors.fill: parent
            color: "#FFFFFF"

            layer.enabled: true
            layer.effect: DropShadow {
                horizontalOffset: 1
                verticalOffset: 1
                radius: 5
                samples: 6
                color: Qt.rgba(0,0,0, 0.20)
            }
        }

        RowLayout {
            id: btItems
            anchors.fill: parent
            anchors.rightMargin: 15
            //anchors.leftMargin: 10

            state: "Explore"

            Repeater {
                id: repeater
                model: ListModel {
                    id: listModel
                    ListElement {
                        iicon: "home"
                        ilabel: "Explore"
                    }
                    ListElement {
                        iicon: "favorite"
                        ilabel: "Watchlist"
                    }
                    ListElement {
                        iicon: "local_offer"
                        ilabel: "Deals"
                    }
                    ListElement {
                        iicon: "notifications"
                        ilabel: "Notifications"
                    }
                }
                BottomMenuItem {
                    Layout.fillHeight: parent
                    Layout.fillWidth: parent
                    Layout.alignment: Qt.AlignHCenter
                    Layout.bottomMargin: 3
                    Layout.topMargin: 3
                    icon: iicon
                    label: ilabel
                    selected: btItems.state === ilabel
                    onClicked: {
                        btItems.state = ilabel
                    }
                }
            }
        }
    }
}
