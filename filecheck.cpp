#include "filecheck.h"

FileCheck::FileCheck()
{

}

bool FileCheck::sl_exist(QString file_url)
{
    if(file_url.contains("file://"))
        file_url.remove("file://");


    QFile obj_file(file_url);

    return obj_file.exists();
}

QString FileCheck::sl_Read(QString file_url)
{
    if(file_url.contains("file://"))
        file_url.remove("file://");


    QFile obj_file(file_url);
    obj_file.open(QIODevice::ReadOnly);

    return QString::fromStdString(obj_file.readAll().toStdString());
}

int FileCheck::sl_Size(QString file_url)
{
    if(file_url.contains("file://"))
        file_url.remove("file://");

    int size = 0;
    QFile obj_file(file_url);
    if(obj_file.open(QIODevice::ReadOnly))
    {

        QByteArray data = obj_file.readAll();
        size = data.size();
    }
    else
        qDebug() <<obj_file.errorString();

    return size;
}
