#ifndef HELPER_H
#define HELPER_H
#include<QQuickItem>
#include <QtCharts>
#include <QGraphicsScene>
#include <QQmlContext>
#include <QObject>

class Helper :public QObject
{
    Q_OBJECT
public:
    Helper();
    ~Helper();
    Q_INVOKABLE void update_chart(QQuickItem *item);
    Q_INVOKABLE void update_axes(QtCharts::QAbstractAxis *axisX, QtCharts::QAbstractAxis *axisY);
};

#endif // HELPER_H
