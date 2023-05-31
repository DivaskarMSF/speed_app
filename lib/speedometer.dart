import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:math' as math;

class SpeedoMeter extends CustomPainter {
  int userInputVal;
  var minVal = 5;
  var maxVal = 35;

  var piValue = math.pi; // 3.14

  var archAngle = 0.52; //piValue / 6;
  var spaceAngle = 0.05; 

  SpeedoMeter(this.userInputVal) {
    if (userInputVal < minVal) {
      userInputVal = minVal;
    }

    if (userInputVal > maxVal) {
      userInputVal = maxVal;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    setArcPaint(canvas, size);
    drawCenterCirclePaint(canvas, size);
    drawNeedlePaint(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void setArcPaint(Canvas canvas, Size size) {
    var sweepAngle = archAngle - spaceAngle;
    var colorAndStartAngleMap = {
      3.14: Colors.red,
      3.66: Colors.red,
      4.19: Colors.red,
      4.71: Colors.green,
      5.23: Colors.green,
      5.76: Colors.green
    };

    var paint = Paint();
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 10;

    colorAndStartAngleMap.forEach((key, value) {

      paint.color = value; // color
      
      canvas.drawArc(
          Rect.fromCenter(
              center: Offset(size.width / 2, size.height / 2),
              width: size.width,
              height: size.height),
          key, // start angle
          sweepAngle, // sweep angle
          false,
          paint);
    });
  }


 // Draw the center circle.
  void drawCenterCirclePaint(Canvas canvas, Size size) {
   
    Paint pivotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 7, pivotPaint);
  }

// needle design.
  void drawNeedlePaint(Canvas canvas, Size size) {
    var circleRadius = size.width / 2;
    var needleLength = circleRadius * 0.9;

    var reducedUserInputVal = userInputVal - minVal;
    var reducedMaxVal       = maxVal - minVal;

    var degreeVal = (reducedUserInputVal * piValue) / reducedMaxVal;
    var needleEndX = circleRadius - (needleLength * math.cos(degreeVal));
    var needleEndY = circleRadius - (needleLength * math.sin(degreeVal));

    Paint needlePaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    var p1 = Offset(size.width / 2, size.height / 2);
    var p2 = Offset(needleEndX, needleEndY);
    canvas.drawLine(p1, p2, needlePaint);
  }
}
