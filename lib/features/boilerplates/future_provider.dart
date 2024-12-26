import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Simulate a network request
Future<String> fetchGreeting() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Hello from Riverpod!';
}

// Create a FutureProvider
final greetingProvider = FutureProvider<String>((ref) async {
  return fetchGreeting();
});

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Async Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GreetingScreen(),
    );
  }
}

class GreetingScreen extends ConsumerWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the async provider
    final asyncGreeting = ref.watch(greetingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Async State with Riverpod')),
      body: Center(
        child: asyncGreeting.when(
          data: (greeting) => Text(greeting, style: const TextStyle(fontSize: 24)),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
    );
  }
}
