#ifndef READER_H
#define READER_H
#include <QObject>
#include <QDebug>


class Reader: public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool m_isReadable READ m_isReadable WRITE m_setReadable NOTIFY isReadModeChanged)
public:
    Reader();
    bool m_isReadable();
    void m_setReadable(bool val);

signals:
    void isReadModeChanged();
private:
    bool b_isReadMode = false;
};

#endif // READER_H
