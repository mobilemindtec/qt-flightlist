import QtQuick 2.15

Rectangle{
    //width: parent.width
    //height: parent.height * .55
    color: Qt.rgba(0, 0, 0, 0)
    Canvas {
        width: parent.width
        height: parent.height
        clip: true
        onPaint: {

            //Color firstColor = Color(0xFFF47D15);
            //Color secondColor = Color(0xFFEF772C);

            var ctx = getContext("2d")

            var gradient = ctx.createLinearGradient(0,0,parent.width,250)
            gradient.addColorStop(0, "#F47D15")
            gradient.addColorStop(0.3, "#EF772C")

            ctx.beginPath()
            ctx.fillStyle = gradient //"#F47D15"
            ctx.moveTo(0,0)
            ctx.lineTo(0, parent.height)

            var firstPoint = {
                dx: parent.width * .5,
                dy: parent.height - 30
            }

            var firstControlpoint = {
                dx: parent.width * .25,
                dy: parent.height - 50
            }

            ctx.quadraticCurveTo(firstControlpoint.dx,firstControlpoint.dy,firstPoint.dx,firstPoint.dy);

            var secondPoint = {
                dx: parent.width,
                dy: parent.height - 80
            }
            var secondControlPoint = {
                dx: parent.width * .75,
                dy: parent.height - 10
            }

            ctx.quadraticCurveTo(secondControlPoint.dx,secondControlPoint.dy,secondPoint.dx,secondPoint.dy);

            ctx.lineTo(parent.width, 0)



            // left line through path closing
            //ctx.closePath()
            //ctx.clip()
            //// fill using fill style
            ctx.fill()
            // stroke using line width and stroke style
            //ctx.stroke()

        }
    }
}
