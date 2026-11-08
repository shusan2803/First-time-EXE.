

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import QtQuick.Studio.DesignEffects

Rectangle {
    id: rectangle
    width: 1280
    height: 720
    color: "#000000"
    property alias image3: image3

    property alias label0: label0
    property alias button0: button0
    property alias button1: button1
    property alias button2: button2
    property alias button3: button3
    property alias bg0Color: bg0.color
    property alias bg1Color: bg1.color
    property alias bg2Color: bg2.color
    property alias bg3Color: bg3.color
    property alias timerLabel: timerLabel

    Image {
        id: image3
        x: 0
        y: 0
        width: 1280
        source: "images/image3.jpg"
        fillMode: Image.PreserveAspectFit

        Label {
            id: label0
            x: 24
            y: 24
            width: 1220
            height: 285
            text: qsTr("Label")
            wrapMode: Text.WordWrap
            font.pointSize: 24
            font.bold: true
            font.family: "Arial"
        }
        Label {
            id: timerLabel
            x: 1020
            y: 345
            width: 150
            height: 40
            text: "00:00"
            font.pointSize: 22
            font.bold: true
            color: "#f39c12"
        }
        Button {
            id: button0
            x: 0
            y: 422
            width: 640
            height: 142
            text: qsTr("Button")
            font.pointSize: 15
            flat: true
            icon.color: "#f1ed0b"
            font.bold: true
            font.family: "Arial"
            background: Rectangle {
                    id: bg0
                    color: "#2c3e50"
                    radius: 8
                    border.color: "#3498db"
                    border.width: 2
                }
            contentItem: Text {
                    text: button0.text
                    font: button0.font
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                }
        }

        Button {
            id: button1
            x: 646
            y: 422
            width: 634
            height: 142
            text: qsTr("Button")
            font.pointSize: 15
            flat: true
            icon.color: "#f1ed0b"
            font.bold: true
            font.family: "Arial"
            background: Rectangle {
                    id: bg1
                    color: "#2c3e50"
                    radius: 8
                    border.color: "#3498db"
                    border.width: 2
                }
            contentItem: Text {
                text: button1.text
                font: button1.font
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
    }
        }

        Button {
            id: button2
            x: 0
            y: 578
            width: 640
            height: 142
            text: qsTr("Button")
            font.pointSize: 15
            flat: true
            icon.color: "#f1ed0b"
            font.bold: true
            font.family: "Arial"
            background: Rectangle {
                    id: bg2
                    color: "#2c3e50"
                    radius: 8
                    border.color: "#3498db"
                    border.width: 2
                }
            contentItem: Text {
                    text: button2.text
                    font: button2.font
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                }
        }

        Button {
            id: button3
            x: 640
            y: 578
            width: 640
            height: 142
            text: qsTr("Button")
            font.pointSize: 15
            flat: true
            icon.color: "#f1ed0b"
            font.bold: true
            font.family: "Arial"
            background: Rectangle {
                    id: bg3
                    color: "#2c3e50"
                    radius: 8
                    border.color: "#3498db"
                    border.width: 2
                }
            contentItem: Text {
                    text: button3.text
                    font: button3.font
                    color: "white"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                }
        }
    }
}