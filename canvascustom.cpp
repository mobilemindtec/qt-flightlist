#include "canvascustom.h"

CanvasCustom::CanvasCustom(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{

}

void CanvasCustom::setColor(const QColor &color){
    this->m_color = color;
}

QColor CanvasCustom::color() const{
    return this->m_color;
}

void CanvasCustom::paint(QPainter *painter){

    QPainterPath path;

    //var ctx = getContext("2d")
    //var gradient = ctx.createLinearGradient(0,0,parent.width,250)
    //gradient.addColorStop(0, "#F47D15")
    //gradient.addColorStop(0.3, "#EF772C")

    //ctx.fillStyle = gradient //"#F47D15"

    path.moveTo(0, 0);
    path.lineTo(0, this->height());

    QPoint firstEndPoint = QPoint(this->width() * 0.5, this->height() - 30);
    QPoint firstStartPoint = QPoint(this->width() * 0.25, this->height() - 50);
    path.quadTo(firstStartPoint, firstEndPoint);


    firstEndPoint = QPoint(this->width(), this->height() - 80);
    firstStartPoint = QPoint(this->width() * 0.75, this->height() - 10);
    path.quadTo(firstStartPoint, firstEndPoint);

    path.lineTo(this->width(), 0);

    QColor color1 = QColor::fromRgb(244, 125, 21);
    QColor color2 = QColor::fromRgb(239, 119, 44);

    QLinearGradient linearGrad(QPoint(0, 0), QPoint(this->width(), this->width()*0.5));
    linearGrad.setColorAt(0, color1);
    linearGrad.setColorAt(1, color2);

    painter->fillPath(path, QBrush(linearGrad));


    // left line through path closing
    //ctx.closePath()
    //ctx.clip()
    //// fill using fill style
    //ctx.fill()

}
