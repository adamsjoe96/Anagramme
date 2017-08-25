#include <QGuiApplication>
#include<QApplication>
#include <QQmlApplicationEngine>
#include"gamer.h"
#include<QQmlComponent>
#include<QQmlContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<Message>("Mess", 1, 0, "Message");
    Gamer gaming;
    gaming.initialise();
    engine.rootContext()->setContextProperty("gaming", &gaming);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;
//    QObject* scan = engine.rootObjects().first()->findChild<QObject*>("scan");
//    QObject::connect(scan, SIGNAL(wordTransmit(QString)), game, SLOT(checkForName(QString)));

    return app.exec();
}
