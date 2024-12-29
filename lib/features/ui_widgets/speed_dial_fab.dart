
import 'package:flutter/material.dart';

class SpeedDialFAB extends StatefulWidget {
  final List<SpeedDialItem> items;

  const SpeedDialFAB({Key? key, required this.items}) : super(key: key);

  @override
  State<SpeedDialFAB> createState() => _SpeedDialFABState();
}

class SpeedDialItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  SpeedDialItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class _SpeedDialFABState extends State<SpeedDialFAB>
    with SingleTickerProviderStateMixin {
  bool _isOpen = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizeTransition(
          sizeFactor: _animation,
          child: Column(
            children: widget.items.map((item) => _buildSpeedDialItem(item)).toList(),
          ),
        ),
        FloatingActionButton(
          onPressed: _toggleMenu,
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animation,
          ),
        ),
      ],
    );
  }

  Widget _buildSpeedDialItem(SpeedDialItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(item.label),
            ),
          ),
          FloatingActionButton.small(
            onPressed: item.onTap,
            child: Icon(item.icon),
          ),
        ],
      ),
    );
  }
}