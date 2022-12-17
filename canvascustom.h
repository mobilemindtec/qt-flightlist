#ifndef CANVASCUSTOM_H
#define CANVASCUSTOM_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPainterPath>
#include <QPainter>
#include <QLinearGradient>

class CanvasCustom : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor)
    QML_ELEMENT
public:
    CanvasCustom(QQuickItem *parent = 0);

    void setColor(const QColor &color);
    QColor color() const;

    void paint(QPainter *painter);

private:
    QColor m_color;
};

#endif // CANVASCUSTOM_H
