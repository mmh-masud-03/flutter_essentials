import 'package:flutter/material.dart';

class DragAndDropScreen extends StatelessWidget {
  const DragAndDropScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drag & Drop Example')),
      body: Center(
        child: Draggable(
          data: 'Dragged Item',
          feedback: Container(
            color: Colors.blue,
            width: 100,
            height: 100,
            child: const Center(child: Text('Drag Me')),
          ),
          child: Container(
            color: Colors.green,
            width: 100,
            height: 100,
            child: const Center(child: Text('Drag Me')),
          ),
        ),
      ),
    );
  }
}
