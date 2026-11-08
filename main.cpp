#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QUrl>

using namespace Qt::StringLiterals;

int main(int argc, char *argv[])
{
    qputenv("QML_XHR_ALLOW_FILE_READ", "1");

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);

    // Load App.qml through the compiled resource system
    engine.load(QUrl(u"qrc:/qt/qml/TestContent/App.qml"_s));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}