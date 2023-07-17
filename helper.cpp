#include "helper.h"

Helper::Helper()
{

}

Helper::~Helper()
{

}

void Helper::update_chart(QQuickItem *item)
{

    if(QGraphicsScene *scene = item->findChild<QGraphicsScene *>()){
        for(QGraphicsItem *it : scene->items()){
            if(QtCharts::QChart *chart = dynamic_cast<QtCharts::QChart *>(it)){
                // Customize chart background
                QLinearGradient backgroundGradient;
                backgroundGradient.setStart(QPointF(0, 0));
                backgroundGradient.setFinalStop(QPointF(0, 1));
                backgroundGradient.setColorAt(0.0, QRgb(0xd2d0d1)); // "#dcd0d1"
                backgroundGradient.setColorAt(1.0, QRgb(0xa04547)); // "#a04547" // 4c4547
                backgroundGradient.setCoordinateMode(QGradient::ObjectBoundingMode);
                chart->setBackgroundBrush(backgroundGradient);
                // Customize plot area background
                QLinearGradient plotAreaGradient;
                plotAreaGradient.setStart(QPointF(0, 1));
                plotAreaGradient.setFinalStop(QPointF(1, 0));
                plotAreaGradient.setColorAt(0.0, QRgb(0x555555));
                plotAreaGradient.setColorAt(1.0, QRgb(0x55aa55));
                plotAreaGradient.setCoordinateMode(QGradient::ObjectBoundingMode);
                chart->setPlotAreaBackgroundBrush(plotAreaGradient);
                chart->setPlotAreaBackgroundVisible(true);
            }
        }
    }

}

void Helper::update_axes(QtCharts::QAbstractAxis *axisX, QtCharts::QAbstractAxis *axisY)
{
    if(axisX && axisY){
        // Customize axis colors
        QPen axisPen(QRgb(0xd18952));
        axisPen.setWidth(2);
        axisX->setLinePen(axisPen);
        axisY->setLinePen(axisPen);
        // Customize grid lines and shades
        axisY->setShadesPen(Qt::NoPen);
        axisY->setShadesBrush(QBrush(QColor(0x99, 0xcc, 0xcc, 0x55)));
    }
}
