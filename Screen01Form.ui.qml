

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Test

Rectangle {
    id: rectangle
    width: 1280
    height: 720
    color: "#000000"
    property alias label2: label2
    property alias label1: label1
    property alias label0: label0
    antialiasing: true

    Label {
        id: label0
        x: 340
        y: 290
        width: 572
        height: 128
        visible: true
        text: qsTr("Project QUIZ!")
        horizontalAlignment: Text.AlignHCenter
        font.styleName: "Bold Italic"
        font.pointSize: 60
    }

    states: [
        State {
            name: "clicked"
        }
    ]

    Label {
        id: label1
        x: 154
        y: 297
        width: 972
        height: 127
        text: "Collage Level Questions"
        horizontalAlignment: Text.AlignHCenter
        font.italic: true
        font.bold: true
        font.pointSize: 54
    }

    Label {
        id: label2
        x: 12
        y: 104
        width: 1257
        height: 500
        text: "WARNING!!!\n\nYou're device is currently being monitored\nand your internet connection is being terminated\nwhile going through this quiz, please do not Tab out\nor try to use any type of browser, this is just \nfor educational purpose to test your knowledge\nif you cheat you're gaining nothing from it."
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.family: "Arial"
        font.pointSize: 36
    }
}
