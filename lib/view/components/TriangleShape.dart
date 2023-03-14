// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mini_payment_app/view/style/style.dart';

class DrawTriangleShape extends CustomPainter {
  Paint painter = Paint()
    ..color = Style.primaryColor
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
