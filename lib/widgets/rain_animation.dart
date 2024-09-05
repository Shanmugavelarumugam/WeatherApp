import 'package:flutter/material.dart';

class RainAnimation extends StatefulWidget {
  @override
  _RainAnimationState createState() => _RainAnimationState();
}

class _RainAnimationState extends State<RainAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
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
          painter: RainPainter(_controller.value),
          size: Size(200, 200),
        );
      },
    );
  }
}

class RainPainter extends CustomPainter {
  final double animationValue;

  RainPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3.0;

    // Draw falling raindrops
    for (int i = 0; i < 20; i++) {
      final startX = i * 10.0;
      final startY = animationValue * size.height - 100.0;
      final endY = startY + 20.0;

      if (startY > size.height) continue;

      canvas.drawLine(
        Offset(startX, startY),
        Offset(startX, endY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(RainPainter oldDelegate) => true;
}
