# Project QUIZ!

A desktop multiple-choice quiz app built with **C++ and Qt Quick (QML)**. The project was created with Qt Creator / Qt Design Studio and currently includes five subject areas, with five questions in each subject.

## Requirements

- Qt 6 with Qt Quick and Qt Quick Controls
- Qt Creator and a compatible C++ compiler
- 
## Install the Windows app

Download `Quiz.App-1.0.0-win64.exe` from the [Pre-release Quiz app v1.0.0 release](https://github.com/shusan2803/First-time-EXE./releases/tag/PreReleaseQuizapp_v.1.0.0), then run the downloaded installer. This release provides a Windows 64-bit executable.

## Build 

Open the project in Qt Creator and select a Qt 6 kit. Setup adjustments may be needed.

## Project files

`main.cpp` starts the app. `App.qml` manages quiz state and navigation. `Screen01.qml`–`Screen04.qml` implement the screens, with matching `*Form.ui.qml` files for layouts. Questions are stored in `questions.json`.

## Known Limitations

Subject selection does not filter questions, **Load** does not restore progress, and multi-answer questions are unsupported. 
