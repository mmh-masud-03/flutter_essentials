import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  _RotationTransitionExampleState createState() => _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: const Icon(Icons.refresh, size: 50, color: Colors.blue),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
