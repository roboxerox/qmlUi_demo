#include "mydatabase.h"

MyDatabase::MyDatabase()
{
}

bool MyDatabase::m_OpenDB()
{
    QString strCounter = QString::number(icounter++);
    dba = QSqlDatabase::addDatabase("QSQLITE" , "CONN"+QString::number(QDateTime::currentMSecsSinceEpoch())+strCounter);
    dba.setDatabaseName(QDir::currentPath()+QDir::separator()+"employee_info.db");
    if(!dba.open())
    {
        strSqliteError = "Failed to open "+dba.databaseName();
        qDebug() << __FUNCTION__<< "Can't Connect to DB !";
        return false;
    }
    else
        qDebug() << __FUNCTION__ << "Connected Successfully to DB !";

    return true;
}

void MyDatabase::setMap(QVariantMap map)
{
    if(mMap != map) {
        mMap = map;
        emit mapChanged();
    }

    qDebug ()<< mMap;
}

bool MyDatabase::m_CreateTable( QString TableName)
{
    strSqliteError.clear();

    if(m_OpenDB())
    {
        QSqlQuery qry_Creation(QSqlDatabase::database(dba.connectionName()));
        QString str_Columns;
        for (QVariantMap::iterator cMap = mMap.begin(); cMap != mMap.end(); ++cMap)
        {
            str_Columns += cMap.key() + " ";
            str_Columns += cMap.value().toString() + ", ";
        }
        str_Columns.remove(str_Columns.size()-2,1);

        QString str_CreationQry = "Create Table if not exists " + TableName + " ( " + str_Columns + " );";
        qry_Creation.prepare(str_CreationQry);

        if (! qry_Creation.exec())
        {
            strSqliteError = qry_Creation.lastError().text() +"; Query = "+qry_Creation.lastQuery();
            dba.close();
            return false;
        }
        qry_Creation.finish();

        qDebug() << __FUNCTION__ << "Table Creation of " << TableName << " executed successfully";
        dba.close();
        return true;
    }
    return false;
}

bool MyDatabase::m_InsertTable(QString TableName)
{
    strSqliteError.clear();
    if(m_OpenDB())
    {
        QSqlQuery qry_Insertion(QSqlDatabase::database(dba.connectionName()));
        QString str_ColumnsName;
        QString str_ColumnsData;

        for (QVariantMap::iterator cMap = mMap.begin(); cMap != mMap.end(); ++cMap)
        {
            str_ColumnsName = str_ColumnsName + " "  + cMap.key() + ", ";
            str_ColumnsData = str_ColumnsData + "\"" + cMap.value().toString() + "\"" + ",";
        }

        str_ColumnsName.remove(str_ColumnsName.lastIndexOf(","),1);
        str_ColumnsData.remove(str_ColumnsData.lastIndexOf(","),1);


        QString str_InsertQry = "Insert into " + TableName + " (" + str_ColumnsName + " )" + " VALUES (" + str_ColumnsData + " );";

        qry_Insertion.prepare(str_InsertQry);

        if (! qry_Insertion.exec())
        {
            strSqliteError = qry_Insertion.lastError().text() +"; Query = "+qry_Insertion.lastQuery();
            dba.close();
            return false;
        }

        qDebug() << __FUNCTION__  << "Insertion qry executed successfully ";
        dba.close();
        return true;
    }
    return false;
}
