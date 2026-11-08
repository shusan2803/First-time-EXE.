import QtQuick
import QtQuick.Controls
import Test

Screen01Form {
    id: screen01Root
    property int sequencestep: 0

    ListModel {
        id: subjectsModel
    }

    Component.onCompleted: {
        loadAllSubjects();
    }

        // Function to load questions.json and populate the subjects model
    function loadAllSubjects() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "questions.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200 || xhr.status === 0) {
                    try {
                        var jsonResponse = JSON.parse(xhr.responseText);

                        // Save raw data globally in mainWindow if other screens need it
                        if (typeof mainWindow !== "undefined") {
                            mainWindow.quizData = jsonResponse.subjects;
                        }

                        subjectsModel.clear();
                        for (var i = 0; i < jsonResponse.subjects.length; i++) {
                            subjectsModel.append(jsonResponse.subjects[i]);
                        }
                        console.log("Successfully loaded subjects.");
                    } catch (e) {
                        console.log("Error parsing JSON: " + e);
                    }
                } else {
                    console.log("Failed to load questions.json. Status: " + xhr.status);
                }
            }
        }
        xhr.send();
    }

    GridView {
        id: gridView
        anchors.fill: parent
        anchors.margins: 30
        model: subjectsModel // <--- This matches the ListModel ID above
        cellWidth: (parent.width - 60) / 2
        cellHeight: 120

        delegate: Item {
            width: gridView.cellWidth - 20
            height: gridView.cellHeight - 20

            Rectangle {
                anchors.fill: parent
                color: mouseArea.containsMouse ? "#34495e" : "#2c3e50"
                radius: 12
                border.color: "#3498db"
                border.width: 2

                Text {
                    anchors.centerIn: parent
                    text: model.name
                    color: "white"
                    font.pixelSize: 20
                    font.bold: true
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                    width: parent.width - 20
                }

                MouseArea {
                    id: mouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onClicked: {
                        // Set selected subject index and push to Title Screen (Screen 2)
                        if (typeof mainWindow !== "undefined") {
                            mainWindow.selectedSubjectIndex = model.index;
                            mainWindow.score = 0;
                            mainWindow.currentQuestionIndex = 0;
                        }

                        // Navigate to Screen 2 (Title / Welcome screen)
                        stackView.push("qrc:/qt/qml/TestContent/Screen02.qml");
                    }
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (sequencestep <2) {
                sequencestep++
            } else {
                stackView.push(screen02Component)
            }
        }
    }

    Timer {
        interval: 4000
        running: true
        repeat: true
        onTriggered: {
            if (sequencestep < 2) {
                sequencestep++
            } else {
                stop()
                stackView.push(screen02Component)
            }
        }
    }

    label0.opacity: sequencestep == 0 ?1.0:0.0
    label0.visible: opacity >0

    label1.opacity: sequencestep == 1 ?1.0:0.0
    label1.visible: opacity >0

    label2.opacity: sequencestep == 2 ?1.0:0.0
    label2.visible: opacity >0
}
