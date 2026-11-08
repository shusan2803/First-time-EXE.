

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls

Rectangle {
    id: rectangle
    width: 1280
    height: 720
    property alias label2: label2
    property alias label0: label0
    property alias label1: label1
    property alias button: button
    property alias image4: image4

    Image {
        id: image4
        width: 1280
        source: "images/image4.jpg"
        fillMode: Image.PreserveAspectFit

        Button {
            id: button
            x: 374
            y: 526
            width: 542
            height: 98
            text: qsTr("  ")
            flat: true
        }

        Label {
            id: label0
            x: 490
            y: 188
            width: 138
            height: 66
            text: qsTr("Label")
            font.pointSize: 40
            font.bold: true
        }

        Label {
            id: label1
            x: 1092
            y: 181
            width: 114
            height: 80
            text: qsTr("Label")
            font.pointSize: 40
            font.bold: true
        }

        Label {
            id: label2
            x: 686
            y: 368
            width: 236
            height: 68
            text: qsTr("Label")
            font.pointSize: 38
            font.bold: true
        }
    }
}
