import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isExpanded = false;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: _toggleContainer,
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            width: _isExpanded ? 200 : 100,
            height: _isExpanded ? 200 : 100,
            color: _isExpanded ? Colors.orange : Colors.cyan,
            curve: Curves.easeInOut,
          ),
        ),
        const SizedBox(height: 10),
        const Text('Tap the container to animate'),
      ],
    );
  }
}
