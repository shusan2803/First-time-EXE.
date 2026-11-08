import QtQuick
import Test

Screen04Form {
    id: scoreScreen

    // Properties passed from Screen03 when pushed onto the StackView
    property int finalScore: 0
    property int totalQuestions: 5
    property int totalTimeSconds: 0

    function formatTime(seconds) {
        var mins = Math.floor(seconds / 60);
        var secs = seconds % 60;
        return mins > 0 ? mins + "m " + secs + "s" : secs + "s";
    }

    Component.onCompleted: {
        label0.text = finalScore;
        label1.text = totalQuestions-finalScore;
        label2.text = formatTime(totalTimeSconds);
        button.text = "Back to Subjects";
    }

    button.onClicked: {
        mainWindow.score = 0;
        mainWindow.currentQuestionIndex = 0;
        mainWindow.startTime = 0;
        stackView.push(screen02Component);
    }
}