import QtQuick 2.9

Item {
    id: cpBar

    property int size: 150
    property int lineWidth: 5
    property real value: 0

    property color primaryColor: "#29b6f6"
    property color secondaryColor: "#e0e0e0"

    property int animationDuration: 1000

    width: size
    height: size

    onValueChanged: {
        canvas.degree = value * 360;
    }

    Canvas {
        id: canvas

        property real degree: 0

        anchors.fill: parent
        antialiasing: true

        onDegreeChanged: {
            requestPaint();
        }

        onPaint: {
            var ctx = getContext("2d");

            var x = cpBar.width/2;
            var y = cpBar.height/2;

            var radius = cpBar.size/2 - cpBar.lineWidth
            var startAngle = (Math.PI/180) * 270;
            var fullAngle = (Math.PI/180) * (270 + 360);
            var progressAngle = (Math.PI/180) * (270 + degree);

            ctx.reset()

            ctx.lineCap = 'round';
            ctx.lineWidth = cpBar.lineWidth;

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, fullAngle);
            ctx.strokeStyle = cpBar.secondaryColor;
            ctx.stroke();

            ctx.beginPath();
            ctx.arc(x, y, radius, startAngle, progressAngle);
            ctx.strokeStyle = cpBar.primaryColor;
            ctx.stroke();
        }

        Behavior on degree {
            NumberAnimation {
                duration: cpBar.animationDuration
            }
        }
    }
}
