import 'package:flutter/material.dart';

class DragAndDropScreen extends StatefulWidget {
  const DragAndDropScreen({super.key});

  @override
  State<DragAndDropScreen> createState() => _DragAndDropScreenState();
}

class _DragAndDropScreenState extends State<DragAndDropScreen> {
  final List<String> _items = ['🍎 Apple', '🍌 Banana', '🍊 Orange', '🍇 Grapes'];
  final List<String> _basket = [];
  bool _isDropped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruit Basket'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _basket.clear();
                _isDropped = false;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Available Fruits:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: _items.map((item) => _buildDraggable(item)).toList(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: DragTarget<String>(
              onWillAccept: (data) => !_basket.contains(data),
              onAccept: (data) {
                setState(() {
                  _basket.add(data);
                  _isDropped = true;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$data added to basket!'),
                    duration: const Duration(seconds: 1),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: candidateData.isNotEmpty
                        ? Colors.green.shade50
                        : Colors.grey.shade50,
                    border: Border.all(
                      color: candidateData.isNotEmpty
                          ? Colors.green
                          : Colors.grey.shade300,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Fruit Basket:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${_basket.length}/${_items.length} collected',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      if (_basket.isEmpty)
                        const Center(
                          child: Text(
                            'Drop fruits here!',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      else
                        Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: _basket.map((item) {
                            return Chip(
                              label: Text(item),
                              deleteIcon: const Icon(Icons.remove_circle),
                              onDeleted: () {
                                setState(() {
                                  _basket.remove(item);
                                });
                              },
                            );
                          }).toList(),
                        ),
                      if (_basket.length == _items.length)
                        Center(
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              const Icon(
                                Icons.celebration,
                                size: 48,
                                color: Colors.amber,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Congratulations! Basket is full!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDraggable(String item) {
    return Draggable<String>(
      data: item,
      feedback: Material(
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue),
          ),
          child: Text(
            item,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
      childWhenDragging: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Text(
          item,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade400,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.blue),
        ),
        child: Text(
          item,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}