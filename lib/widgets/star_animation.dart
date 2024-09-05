import 'dart:math';
import 'package:flutter/material.dart';

class StarAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StarPainter(),
      size: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
    );
  }
}

class StarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    final random = Random();

    // Draw stars randomly on the sky
    for (int i = 0; i < 50; i++) {
      final dx = random.nextDouble() * size.width;
      final dy = random.nextDouble() * size.height;
      canvas.drawCircle(Offset(dx, dy), 2, paint);
    }
  }

  @override
  bool shouldRepaint(StarPainter oldDelegate) => false;
}
