#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "controller.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    //Controller testClass;
    qmlRegisterType <Controller> ("Test1",1,0,"ClassA");

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/WeatherApp/Main.qml"_qs);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    //QQmlContext* _rootContex = engine.rootContext();
    //_rootContex->setContextProperty("classA",&testClass);

    return app.exec();
}
