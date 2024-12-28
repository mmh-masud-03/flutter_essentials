import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Helper'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: [
            _FeatureCard(
              icon: Icons.widgets_outlined,
              title: 'UI Widgets',
              onTap: () {
                Navigator.of(context).pushNamed('/ui-widgets');
              },
            ),
            _FeatureCard(
              icon: Icons.animation,
              title: 'Animations',
              onTap: () {
                Navigator.of(context).pushNamed('/animations-screen');
              },
            ),
            _FeatureCard(
              icon: Icons.code,
              title: 'Boilerplates',
              onTap: () {
                Navigator.of(context).pushNamed("/boilerplate");
              },
            ),
            _FeatureCard(
              icon: Icons.integration_instructions,
              title: 'API Integration',
              onTap: () {
                Navigator.of(context).pushNamed('/api-integration');
              },
            ),
            //examples of ui screens
            _FeatureCard(
              icon: Icons.more,
              title: 'Examples',
              onTap: () {
                Navigator.of(context).pushNamed('/examples');
              },
            ),

          ],
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Theme.of(context).primaryColor),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
