import 'package:flutter/material.dart';

class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({super.key});

  @override
  _SlideTransitionExampleState createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween(begin: const Offset(-1, 0), end: const Offset(1, 0)).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: const Icon(Icons.arrow_forward, size: 50, color: Colors.green),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
