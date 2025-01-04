import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Helper',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        elevation: 0, // Remove app bar shadow
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.95),
      ),
      backgroundColor: Colors.grey[100], // Light background for better contrast
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What would you like to explore?',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1, // Slightly taller cards
                  ),
                  children: [
                    _FeatureCard(
                      icon: Icons.widgets_outlined,
                      title: 'UI Widgets',
                      description: 'Explore various Flutter widgets',
                      onTap: () {
                        Navigator.of(context).pushNamed('/ui-widgets');
                      },
                    ),
                    _FeatureCard(
                      icon: Icons.animation,
                      title: 'Animations',
                      description: 'Create smooth animations',
                      onTap: () {
                        Navigator.of(context).pushNamed('/animations-screen');
                      },
                    ),
                    _FeatureCard(
                      icon: Icons.code,
                      title: 'Boilerplates',
                      description: 'Ready-to-use templates',
                      onTap: () {
                        Navigator.of(context).pushNamed("/boilerplate");
                      },
                    ),
                    _FeatureCard(
                      icon: Icons.integration_instructions,
                      title: 'API Integration',
                      description: 'Connect with external services',
                      onTap: () {
                        Navigator.of(context).pushNamed('/api-integration');
                      },
                    ),
                    _FeatureCard(
                      icon: Icons.more,
                      title: 'Examples',
                      description: 'View sample implementations',
                      onTap: () {
                        Navigator.of(context).pushNamed('/examples');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                spreadRadius: 2,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    size: 32,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}