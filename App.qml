import QtQuick
import QtQuick.Controls
import Test

Window {
    id: mainWindow
    width: 1280
    height: 720
    visible: true
    title: "Project QUIZ!"

    // Global App & Quiz State Properties
    property int score: 0
    property int currentQuestionIndex: 0
    property var allQuestions: []
    property real startTime: 0

    Component.onCompleted: {
        loadAndFlattenQuestions();
    }

    function loadAndFlattenQuestions() {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "questions.json");
        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200 || xhr.status === 0) {
                    try {
                        var jsonResponse = JSON.parse(xhr.responseText);
                        var masterList = [];

                        // 1. Combine all questions from all subjects
                        for (var i = 0; i < jsonResponse.subjects.length; i++) {
                            var subjectQuestions = jsonResponse.subjects[i].questions;
                            for (var j = 0; j < subjectQuestions.length; j++) {
                                masterList.push(subjectQuestions[j]);
                            }
                        }

                        // 2. Shuffle the master list randomly (Fisher-Yates Shuffle)
                        for (var k = masterList.length - 1; k > 0; k--) {
                            var randIndex = Math.floor(Math.random() * (k + 1));
                            var temp = masterList[k];
                            masterList[k] = masterList[randIndex];
                            masterList[randIndex] = temp;
                        }

                        mainWindow.allQuestions = masterList;
                        console.log("Successfully loaded and randomized " + masterList.length + " questions.");
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

    function resetQuiz() {
        currentQuestionIndex = 0;
        score = 0;
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: screen01Component

        Component {
            id: screen01Component
            Screen01 {}
        }

        Component {
            id: screen02Component
            Screen02 {}
        }

        Component {
            id: screen03Component
            Screen03 {}
        }
        Component {
            id: screen04Component
            Screen04 {}
        }
    }
}