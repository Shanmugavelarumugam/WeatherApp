import 'package:flutter/material.dart';

class MoonAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MoonPainter(),
      size: Size(100, 100),
    );
  }
}

class MoonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.yellowAccent;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, paint);

    paint.color = Colors.black;
    canvas.drawCircle(Offset(size.width / 2 + 10, size.height / 2), 40, paint);
  }

  @override
  bool shouldRepaint(MoonPainter oldDelegate) => false;
}
