#ifndef MYDATABASE_H
#define MYDATABASE_H
#include <QObject>
#include <QDebug>
#include <QSqlDatabase>
#include <QSqlError>
#include <QDateTime>
#include <QDir>
#include <QSqlQuery>


class MyDatabase : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QVariantMap map READ map WRITE setMap NOTIFY mapChanged)

    long icounter = 0 ;
    QString strSqliteError;
    QSqlDatabase dba;
public:
    MyDatabase();
    Q_INVOKABLE bool m_OpenDB();
    QMap<QString,QString> rawMap;
    QVariantMap map() const { return mMap; }
    void setMap(QVariantMap map) ;

public slots:
    bool m_CreateTable(QString TableName);/*, QMap<QString, QString> attributes);*/
    bool m_InsertTable(QString TableName);
signals:
    void mapChanged();

private:
    QVariantMap mMap;

};

#endif // MYDATABASE_H
