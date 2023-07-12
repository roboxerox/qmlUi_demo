#ifndef FILECHECK_H
#define FILECHECK_H

#include <QObject>
#include <QFile>
#include <QDebug>

class FileCheck : public QObject
{
    Q_OBJECT
public:
    explicit FileCheck();
signals:

public slots:
    bool sl_exist(QString file_url);
    QString sl_Read(QString file_url);
    int sl_Size(QString file_url);
};

#endif // FILECHECK_H
