import QtQuick
import Test

Screen02Form {
    button0.onClicked: {
        mainWindow.resetQuiz();
        mainWindow.score = 0;
        mainWindow.currentQuestionIndex = 0;
        mainWindow.startTime = Date.now();
        // Push Screen 3 (Quiz Screen)
        stackView.push(screen03Component);
        }
    button1.onClicked: {
        console.log("Load Clicked.)");
    }

    button2.onClicked: {
        Qt.quit();
    }
}
