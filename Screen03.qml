import QtQuick
import QtQuick.Layouts
import Test

Screen03Form {
    id: quizScreen

    property var currentQ: (mainWindow.allQuestions.length > 0 &&
                            mainWindow.currentQuestionIndex < mainWindow.allQuestions.length) ?
                           mainWindow.allQuestions[mainWindow.currentQuestionIndex] : null

    property int totalQuestions: mainWindow.allQuestions.length

    // Keep track of user selections for the current question
    property var selectedChoices: []
    property int elapsedSeconds: 0

    Timer {
        id: liveQuizTimer
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            quizScreen.elapsedSeconds++;
            timerLabel.text = formatTime(quizScreen.elapsedSeconds);
        }
    }

    function formatTime(totalSecs) {
        var mins = Math.floor(totalSecs / 60);
        var secs = totalSecs % 60;
        var formattedMins = mins < 10 ? "0" + mins : mins;
        var formattedSecs = secs < 10 ? "0" + secs : secs;
        return formattedMins + ":" + formattedSecs;
    }

    onCurrentQChanged: {
        selectedChoices = []; // Reset selections for the new question
        updateUI();
    }

    Component.onCompleted: updateUI()

    function updateUI() {
        if (currentQ) {
            label0.text = currentQ.question;
            button0.text = currentQ.options[0] !== undefined ? currentQ.options[0] : "";
            button1.text = currentQ.options[1] !== undefined ? currentQ.options[1] : "";
            button2.text = currentQ.options[2] !== undefined ? currentQ.options[2] : "";
            button3.text = currentQ.options[3] !== undefined ? currentQ.options[3] : "";
        } else {
            label0.text = "Loading questions...";
        }
    }
    bg0Color: selectedChoices.indexOf(0) !== -1 ? "#27ae60" : "#2c3e50"
    bg1Color: selectedChoices.indexOf(1) !== -1 ? "#27ae60" : "#27ae60"
    bg2Color: selectedChoices.indexOf(2) !== -1 ? "#27ae60" : "#27ae60"
    bg3Color: selectedChoices.indexOf(3) !== -1 ? "#27ae60" : "#27ae60"

    // Helper to check if two arrays match regardless of order
    function arraysEqual(a, b) {
        // If 'answer' in JSON is written as a single number (e.g., answer: 2)
        if (!Array.isArray(b)) {
            return a.length === 1 && a[0] === b;
        }
        if (a.length !== b.length) return false;
        var sortedA = a.slice().sort();
        var sortedB = b.slice().sort();
        for (var i = 0; i < sortedA.length; i++) {
            if (sortedA[i] !== sortedB[i]) return false;
        }
        return true;
    }

    function handleOptionClick(index) {
        if (!currentQ) return;

        // Toggle selection for multi-select support
        var idx = selectedChoices.indexOf(index);
        if (idx > -1) {
            selectedChoices.splice(idx, 1); // Deselect if already clicked
        } else {
            selectedChoices.push(index);   // Select option
        }
        selectedChoices = selectedChoices.slice();
        evaluateAnswer();
    }

    function evaluateAnswer() {
        if (!currentQ) return;

        // Check if selections match the correct answer(s)
        var isCorrect = arraysEqual(selectedChoices, currentQ.answer);

        if (isCorrect) {
            mainWindow.score++;
            console.log("Correct! Score: " + mainWindow.score);
        } else {
            console.log("Incorrect or incomplete answer.");
        }

        // Move to next question or finish quiz
        if (mainWindow.currentQuestionIndex < totalQuestions - 1) {
            mainWindow.currentQuestionIndex++;
        } else {
            var elapsedSeconds = Math.floor((Date.now()-mainWindow.startTime)/1000);
            liveQuizTimer.stop();
            console.log("Quiz Completed in " + formatTime(elapsedSeconds) + " seconds.");
            console.log("Quiz completed! Final Score: " + mainWindow.score + " / " + totalQuestions);

            stackView.push(screen04Component, {
                finalScore: mainWindow.score,
                totalQuestions: totalQuestions,
                totalTimeSeconds: elapsedSeconds
            });
        }
    }

    button0.onClicked: handleOptionClick(0)
    button1.onClicked: handleOptionClick(1)
    button2.onClicked: handleOptionClick(2)
    button3.onClicked: handleOptionClick(3)
}