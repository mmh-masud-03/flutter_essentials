import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double springConstant;
  final double dampingRatio;

  const SpringAnimation({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.springConstant = 20,
    this.dampingRatio = 0.7,
  }) : super(key: key);

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
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = SpringSimulation(
      SpringDescription(
        mass: 1,
        stiffness: widget.springConstant,
        damping: widget.dampingRatio,
      ),
      0.0,
      1.0,
      0.0,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, 100 * (1 - _animation.value)),
          child: Opacity(
            opacity: _animation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}

extension on SpringSimulation {
  Animation<double> animate(AnimationController controller) {
    final AnimationController springController = AnimationController.unbounded(
      vsync: controller.vsync,
    );

    final Animation<double> animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(springController);

    springController.addListener(() {
      controller.value = animation.value;
    });

    springController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        springController.dispose();
      }
    });

    springController.animateWith(this);

    return animation;
  }
}

extension on AnimationController {
  get vsync => null;
}
