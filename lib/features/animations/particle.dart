
// Particle Animation
import 'dart:math';

import 'package:flutter/material.dart';

class ParticleAnimation extends StatefulWidget {
  final Color color;
  final int particleCount;

  const ParticleAnimation({
    Key? key,
    this.color = Colors.blue,
    this.particleCount = 30,
  }) : super(key: key);

  @override
  State<ParticleAnimation> createState() => _ParticleAnimationState();
}

class _ParticleAnimationState extends State<ParticleAnimation>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    _initializeParticles();
  }

  void _initializeParticles() {
    particles = List.generate(
      widget.particleCount,
          (index) => Particle(
        position: Offset(
          Random().nextDouble() * 300,
          Random().nextDouble() * 300,
        ),
        speed: Offset(
          Random().nextDouble() * 2 - 1,
          Random().nextDouble() * 2 - 1,
        ),
        radius: Random().nextDouble() * 3 + 1,
      ),
    );
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
          painter: ParticlePainter(
            particles: particles,
            color: widget.color,
          ),
          size: const Size(300, 300),
        );
      },
    );
  }
}

class Particle {
  Offset position;
  Offset speed;
  double radius;

  Particle({
    required this.position,
    required this.speed,
    required this.radius,
  });
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Color color;

  ParticlePainter({
    required this.particles,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    for (var particle in particles) {
      canvas.drawCircle(particle.position, particle.radius, paint);
      particle.position += particle.speed;

      if (particle.position.dx < 0 || particle.position.dx > size.width) {
        particle.speed = Offset(-particle.speed.dx, particle.speed.dy);
      }
      if (particle.position.dy < 0 || particle.position.dy > size.height) {
        particle.speed = Offset(particle.speed.dx, -particle.speed.dy);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}