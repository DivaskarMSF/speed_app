import 'dart:math' as math;
import 'package:flutter/material.dart';

class PlacingRanges extends CustomPainter {
  double piValue = math.pi;

  var rangeAndOffsetMap = const {
    'S3': Offset(-30, 150),
    'S2': Offset(-7, 60),
    'S1': Offset(53, -1),
    'Pivot': Offset(130, -27),
    'R1': Offset(225, -6),
    'R2': Offset(290, 55),
    'R3': Offset(310.0, 135.0),
  };

  @override
  void paint(Canvas canvas, Size size) {
    setTextPainterRanges(canvas, size);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void setTextPainterRanges(Canvas canvas, Size size) {
    
    rangeAndOffsetMap.forEach((key, value) {
      //  var colorObj = Colors.red;
      final TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: key,
            style:
                const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          textDirection: TextDirection.ltr)
        ..layout(maxWidth: size.width);

      textPainter.paint(canvas, value);
    });
  }
}
