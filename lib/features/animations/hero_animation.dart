import 'package:flutter/material.dart';

class HeroAnimationExample extends StatelessWidget {
  const HeroAnimationExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HeroAnimationDetailScreen(),
          ),
        );
      },
      child: Hero(
        tag: 'hero-example',
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ),
    );
  }
}

class HeroAnimationDetailScreen extends StatelessWidget {
  const HeroAnimationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: Center(
        child: Hero(
          tag: 'hero-example',
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
    );
  }
}
