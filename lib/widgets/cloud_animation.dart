import 'package:flutter/material.dart';

class CloudAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CloudPainter(),
      size: Size(200, 100),
    );
  }
}

class CloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey;

    // Draw clouds
    canvas.drawOval(Rect.fromLTWH(50, 20, 100, 60), paint);
    canvas.drawOval(Rect.fromLTWH(20, 40, 120, 50), paint);
    canvas.drawOval(Rect.fromLTWH(90, 30, 100, 70), paint);
  }

  @override
  bool shouldRepaint(CloudPainter oldDelegate) => false;
}
