

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
    color: "#000000"
    property alias button2: button2
    property alias button1: button1
    property alias button0: button0
    property alias image2: image2

    Image {
        id: image2
        x: 0
        y: 0
        width: 1280
        height: 720
        source: "images/image2.jpg"
        fillMode: Image.PreserveAspectFit

        Button {
            id: button0
            x: 498
            y: 210
            width: 287
            height: 82
            text: qsTr("Start")
            highlighted: false
            flat: true
            font.pointSize: 60
            font.bold: true
            font.family: "Arial"
            autoExclusive: false
            checked: false
            checkable: false
        }

        Button {
            id: button1
            x: 500
            y: 298
            width: 285
            height: 85
            visible: true
            text: qsTr("Load")
            flat: true
            clip: false
            font.pointSize: 60
            font.bold: true
            font.family: "Arial"
        }

        Button {
            id: button2
            x: 510
            y: 389
            width: 248
            height: 82
            text: qsTr("Exit")
            font.pointSize: 60
            font.bold: true
            font.family: "Arial"
            flat: true
        }
    }
}
