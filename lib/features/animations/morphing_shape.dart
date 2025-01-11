// Morphing Shape Animation
import 'dart:math';

import 'package:flutter/material.dart';

class MorphingShapeAnimation extends StatefulWidget {
  final Color color;
  final Duration duration;

  const MorphingShapeAnimation({
    super.key,
    this.color = Colors.blue,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<MorphingShapeAnimation> createState() => _MorphingShapeAnimationState();
}

class _MorphingShapeAnimationState extends State<MorphingShapeAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
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
          painter: MorphingShapePainter(
            animation: _controller,
            color: widget.color,
          ),
          size: const Size(200, 200),
        );
      },
    );
  }
}

class MorphingShapePainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  MorphingShapePainter({
    required this.animation,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 3;

    final path = Path();

    for (var i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * pi;
      final offset = sin(animation.value * 2 * pi + i) * 20;
      final x = center.dx + cos(angle) * (radius + offset);
      final y = center.dy + sin(angle) * (radius + offset);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}