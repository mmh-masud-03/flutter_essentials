import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a Notifier for state management
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
}

// Create a NotifierProvider
final counterNotifierProvider = NotifierProvider<CounterNotifier, int>(() => CounterNotifier());

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifier Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterNotifierScreen(),
    );
  }
}

class CounterNotifierScreen extends ConsumerWidget {
  const CounterNotifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterNotifierProvider);
    final counterNotifier = ref.read(counterNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Notifier Example')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Counter: $counter', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: counterNotifier.decrement,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: counterNotifier.increment,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: counterNotifier.reset,
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
