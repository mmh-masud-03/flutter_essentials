// Confetti Animation
import 'dart:math';

import 'package:flutter/material.dart';

class ConfettiAnimation extends StatefulWidget {
  final bool isPlaying;
  final Duration duration;
  final int numberOfParticles;

  const ConfettiAnimation({
    Key? key,
    this.isPlaying = true,
    this.duration = const Duration(seconds: 2),
    this.numberOfParticles = 50,
  }) : super(key: key);

  @override
  State<ConfettiAnimation> createState() => _ConfettiAnimationState();
}

class _ConfettiAnimationState extends State<ConfettiAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<ConfettiParticle> particles;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..addListener(() {
      _updateParticles();
    });
    _initializeParticles();
    if (widget.isPlaying) {
      _controller.repeat();
    }
  }

  void _initializeParticles() {
    particles = List.generate(
      widget.numberOfParticles,
          (index) => ConfettiParticle(
        position: Offset(
          random.nextDouble() * 400,
          -random.nextDouble() * 100,
        ),
        color: Color.fromRGBO(
          random.nextInt(255),
          random.nextInt(255),
          random.nextInt(255),
          1,
        ),
        size: random.nextDouble() * 8 + 2,
        velocity: Offset(
          random.nextDouble() * 4 - 2,
          random.nextDouble() * 2 + 3,
        ),
        angle: random.nextDouble() * pi * 2,
        angularVelocity: random.nextDouble() * 0.3 - 0.15,
      ),
    );
  }

  void _updateParticles() {
    for (var particle in particles) {
      particle.position += particle.velocity;
      particle.angle += particle.angularVelocity;
      particle.velocity += const Offset(0, 0.1); // Gravity

      if (particle.position.dy > MediaQuery.of(context).size.height) {
        particle.position = Offset(
          random.nextDouble() * MediaQuery.of(context).size.width,
          -random.nextDouble() * 100,
        );
        particle.velocity = Offset(
          random.nextDouble() * 4 - 2,
          random.nextDouble() * 2 + 3,
        );
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ConfettiPainter(particles: particles),
      size: Size.infinite,
    );
  }
}

class ConfettiParticle {
  Offset position;
  Color color;
  double size;
  Offset velocity;
  double angle;
  double angularVelocity;

  ConfettiParticle({
    required this.position,
    required this.color,
    required this.size,
    required this.velocity,
    required this.angle,
    required this.angularVelocity,
  });
}

class ConfettiPainter extends CustomPainter {
  final List<ConfettiParticle> particles;

  ConfettiPainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      canvas.save();
      canvas.translate(particle.position.dx, particle.position.dy);
      canvas.rotate(particle.angle);

      final paint = Paint()
        ..color = particle.color
        ..style = PaintingStyle.fill;

      canvas.drawRect(
        Rect.fromCenter(
          center: Offset.zero,
          width: particle.size,
          height: particle.size,
        ),
        paint,
      );
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
