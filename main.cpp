#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>
#include <helper.h>
#include <reader.h>
#include <filecheck.h>
#include <mydatabase.h>


int main(int argc, char *argv[])
{
//    QGuiApplication app(argc, argv);

//    QQmlApplicationEngine engine;
//    engine.load(QUrl(QStringLiteral("qrc:/qmls/main.qml")));
//    if (engine.rootObjects().isEmpty())
//        return -1;

//    return app.exec();



    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QApplication app(argc, argv);
    app.setWindowIcon(QIcon(":/images/qml-ui-demo-logo.png"));

    QQmlApplicationEngine engine;
    // export cpp classes method 1
    Helper helper;
    Reader reader;
    engine.rootContext()->setContextProperty(QStringLiteral("helper"), &helper);
    engine.rootContext()->setContextProperty(QStringLiteral("reader"), &reader);

    // export cpp classes method 2
    qmlRegisterType< FileCheck > ("File_Check",1,0, "FileCheck");
    qmlRegisterType< MyDatabase > ("MyDatabase", 1,0, "MyDatabase");


    const QUrl url(QStringLiteral("qrc:/qmls/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();




}
