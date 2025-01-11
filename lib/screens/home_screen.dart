import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;
    final isDesktop = size.width >= 1200;

    // Calculate responsive values
    final gridCrossAxisCount = isDesktop ? 4 : (isTablet ? 3 : 2);
    final padding = size.width * (isDesktop ? 0.1 : (isTablet ? 0.08 : 0.05));
    final cardAspectRatio = isDesktop ? 1.3 : (isTablet ? 1.2 : 1.1);

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: const Text(
            'Flutter Helper',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.95),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 600),
                      child: Text(
                        'What would you like to explore?',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    GridView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridCrossAxisCount,
                        crossAxisSpacing: padding * 0.5,
                        mainAxisSpacing: padding * 0.5,
                        childAspectRatio: cardAspectRatio,
                      ),
                      children: [
                        _FeatureCard(
                          icon: Icons.widgets_outlined,
                          title: 'UI Widgets',
                          description: 'Explore various Flutter widgets',
                          onTap: () => Navigator.of(context).pushNamed('/ui-widgets'),
                        ),
                        _FeatureCard(
                          icon: Icons.animation,
                          title: 'Animations',
                          description: 'Create smooth animations',
                          onTap: () => Navigator.of(context).pushNamed('/animations-screen'),
                        ),
                        _FeatureCard(
                          icon: Icons.code,
                          title: 'Boilerplates',
                          description: 'Ready-to-use templates',
                          onTap: () => Navigator.of(context).pushNamed('/boilerplate'),
                        ),
                        _FeatureCard(
                          icon: Icons.integration_instructions,
                          title: 'API Integration',
                          description: 'Connect with external services',
                          onTap: () => Navigator.of(context).pushNamed('/api-integration'),
                        ),
                        _FeatureCard(
                          icon: Icons.more,
                          title: 'Examples',
                          description: 'View sample implementations',
                          onTap: () => Navigator.of(context).pushNamed('/examples'),
                        ),
                        _FeatureCard(
                          icon: Icons.language,
                          title: 'Internationalization',
                          description: 'Multi-language support setup',
                          onTap: () => Navigator.of(context).pushNamed('/internationalization'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
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
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width >= 600;

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
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculate adaptive padding based on available space
              final padding = constraints.maxWidth * 0.1;
              final iconSize = isTablet ?
              constraints.maxWidth * 0.25 :
              constraints.maxWidth * 0.18;

              return Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(padding * 0.5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        icon,
                        size: iconSize,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: padding * 0.5),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 18 : 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: padding * 0.25),
                    Flexible(
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                          fontSize: isTablet ? 14 : 12,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}