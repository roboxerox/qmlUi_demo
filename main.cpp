#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
//#include <fileio.h>
#include <helper.h>
#include <reader.h>


int main(int argc, char *argv[])
{
//    QGuiApplication app(argc, argv);

//    FileIO fio;
//    fio.parse(":/ip_links.xml");

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/qmls/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

//    return app.exec();








    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    QQmlApplicationEngine engine;
    Helper helper;
    Reader reader;
    engine.rootContext()->setContextProperty(QStringLiteral("helper"), &helper);
    engine.rootContext()->setContextProperty(QStringLiteral("reader"), &reader);

    const QUrl url(QStringLiteral("qrc:/qmls/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();




}
