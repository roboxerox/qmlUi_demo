#ifndef FILEIO_H
#define FILEIO_H
#include <QObject>
#include <QDebug>
#include <QFile>
#include <QXmlStreamReader>

class FileIO :public QObject
{
    Q_OBJECT

public slots:
    bool parse(const QString& source);

public:
    FileIO();
};

#endif // FILEIO_H
