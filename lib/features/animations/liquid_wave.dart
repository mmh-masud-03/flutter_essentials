
// Liquid Wave Animation
import 'dart:math';

import 'package:flutter/material.dart';

class LiquidWaveAnimation extends StatefulWidget {
  final Color color;
  final double height;
  final Duration duration;

  const LiquidWaveAnimation({
    super.key,
    this.color = Colors.blue,
    this.height = 200,
    this.duration = const Duration(seconds: 2),
  });

  @override
  State<LiquidWaveAnimation> createState() => _LiquidWaveAnimationState();
}

class _LiquidWaveAnimationState extends State<LiquidWaveAnimation>
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
          painter: WavePainter(
            animation: _controller,
            color: widget.color,
          ),
          size: Size(double.infinity, widget.height),
        );
      },
    );
  }
}

class WavePainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  WavePainter({
    required this.animation,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height);

    for (double x = 0; x < size.width; x++) {
      final y = sin((x / size.width * 2 * pi) + (animation.value * 2 * pi)) *
          20 +
          size.height / 2;
      path.lineTo(x, y);
    }

    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
