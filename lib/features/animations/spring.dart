import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class FullscreenSpringDemo extends StatelessWidget {
  const FullscreenSpringDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Spring Animation'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SpringAnimation(
          child: const DemoCard(),
        ),
      ),
    );
  }
}

class DemoCard extends StatelessWidget {
  const DemoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 400,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, Colors.blue],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.3),
            blurRadius: 15,
            spreadRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.animation,
            size: 80,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          const Text(
            'Spring Animation',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tap to animate',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

enum SpringAnimationType {
  slideUp,
  slideDown,
  slideLeft,
  slideRight,
  scale,
  rotate,
  fade,
}

class SpringAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double springConstant;
  final double dampingRatio;
  final SpringAnimationType animationType;
  final bool repeat;
  final VoidCallback? onComplete;
  final Curve curve;
  final double displacement;

  const SpringAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1000),
    this.springConstant = 20,
    this.dampingRatio = 0.7,
    this.animationType = SpringAnimationType.slideUp,
    this.repeat = false,
    this.onComplete,
    this.curve = Curves.easeOutQuart,
    this.displacement = 100,
  });

  @override
  State<SpringAnimation> createState() => _SpringAnimationState();
}

class _SpringAnimationState extends State<SpringAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _setupAnimation();
  }

  void _setupAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    final springSimulation = SpringSimulation(
      SpringDescription(
        mass: 1,
        stiffness: widget.springConstant,
        damping: widget.dampingRatio,
      ),
      0.0,
      1.0,
      0.0,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _controller.animateWith(springSimulation);

    if (widget.repeat) {
      _animation.addStatusListener(_handleAnimationStatus);
    }

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onComplete?.call();
      }
    });
  }

  void _handleAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _controller.reset();
      _controller.forward();
    }
  }

  void _restartAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _animation.removeStatusListener(_handleAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(SpringAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.springConstant != widget.springConstant ||
        oldWidget.dampingRatio != widget.dampingRatio ||
        oldWidget.duration != widget.duration) {
      _setupAnimation();
    }
  }

  Matrix4 _buildTransform(double value) {
    final transform = Matrix4.identity();
    switch (widget.animationType) {
      case SpringAnimationType.slideUp:
        transform.translate(0.0, widget.displacement * (1 - value));
        break;
      case SpringAnimationType.slideDown:
        transform.translate(0.0, -widget.displacement * (1 - value));
        break;
      case SpringAnimationType.slideLeft:
        transform.translate(widget.displacement * (1 - value), 0.0);
        break;
      case SpringAnimationType.slideRight:
        transform.translate(-widget.displacement * (1 - value), 0.0);
        break;
      case SpringAnimationType.scale:
        final scale = 0.5 + (0.5 * value);
        transform.scale(scale, scale);
        break;
      case SpringAnimationType.rotate:
        transform.rotateZ((1 - value) * 0.5);
        break;
      case SpringAnimationType.fade:
        break;
    }
    return transform;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _restartAnimation,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Transform(
            transform: _buildTransform(_animation.value),
            alignment: Alignment.center,
            child: Opacity(
              opacity: widget.animationType == SpringAnimationType.fade
                  ? _animation.value
                  : 1.0,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}