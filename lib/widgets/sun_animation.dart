import 'dart:math';

import 'package:flutter/material.dart';

class SunAnimation extends StatefulWidget {
  @override
  _SunAnimationState createState() => _SunAnimationState();
}

class _SunAnimationState extends State<SunAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: SunPainter(_controller.value),
          size: Size(200, 200),
        );
      },
    );
  }
}

class SunPainter extends CustomPainter {
  final double animationValue;

  SunPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.orangeAccent;

    // Draw sun core
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 50, paint);

    // Draw rotating rays
    for (int i = 0; i < 8; i++) {
      final angle = (3.14 / 4) * i + (animationValue * 2 * 3.14);
      final start = Offset(
        size.width / 2 + 60 * cos(angle),
        size.height / 2 + 60 * sin(angle),
      );
      final end = Offset(
        size.width / 2 + 80 * cos(angle),
        size.height / 2 + 80 * sin(angle),
      );
      canvas.drawLine(start, end, paint..strokeWidth = 4);
    }
  }

  @override
  bool shouldRepaint(SunPainter oldDelegate) => true;
}
