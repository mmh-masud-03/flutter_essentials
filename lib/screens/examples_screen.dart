import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/code_viewer.dart';

class ExamplesScreen extends StatelessWidget {
  const ExamplesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Flutter Examples'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        itemCount: _exampleItems.length,
        itemBuilder: (context, index) => _ExampleCard(
          example: _exampleItems[index],
        ),
      ),
    );
  }
}

class _ExampleItem {
  final String title;
  final String description;
  final String route;
  final String codeUrl;
  final IconData icon;

  const _ExampleItem({
    required this.title,
    required this.description,
    required this.route,
    required this.codeUrl,
    required this.icon,
  });
}

final List<_ExampleItem> _exampleItems = [
  _ExampleItem(
    title: 'Form',
    description: 'Create a form with validation and submission.',
    route: '/form-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/form.dart',
    icon: Icons.edit_document,
  ),
  _ExampleItem(
    title: 'Grid',
    description: 'Create a grid of items using GridView.builder.',
    route: '/grid-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/grid.dart',
    icon: Icons.grid_view,
  ),
  _ExampleItem(
    title: 'List',
    description: 'Create a list of items using ListView.builder.',
    route: '/list-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/list.dart',
    icon: Icons.list_alt,
  ),
  _ExampleItem(
    title: 'Carousel',
    description: 'Create a carousel of images using CarouselSlider.',
    route: '/carousel-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/carousel.dart',
    icon: Icons.view_carousel,
  ),
  _ExampleItem(
    title: 'Tabs',
    description: 'Implement tab navigation with TabBar and TabBarView.',
    route: '/tabs-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/tabs.dart',
    icon: Icons.tab,
  ),
  _ExampleItem(
    title: 'Slivers',
    description: 'Learn about SliverAppBar, SliverList, and SliverGrid.',
    route: '/slivers-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/silvers.dart',
    icon: Icons.view_agenda,
  ),
  _ExampleItem(
    title: 'Charts',
    description: 'Visualize data using bar, line, and pie charts.',
    route: '/charts-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/charts.dart',
    icon: Icons.insert_chart,
  ),
  _ExampleItem(
    title: 'Drag and Drop',
    description: 'Explore drag-and-drop functionality in Flutter.',
    route: '/drag-and-drop-screen',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/drag_and_drop.dart',
    icon: Icons.drag_indicator,
  ),
  _ExampleItem(
    title: 'Bottom Bar',
    description: 'Create a bottom app bar with a floating action button.',
    route: '/bottom-bar',
    codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/bottom_bar.dart',
    icon: Icons.border_bottom,
  ),
];

class _ExampleCard extends StatefulWidget {
  final _ExampleItem example;

  const _ExampleCard({
    required this.example,
  });

  @override
  State<_ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<_ExampleCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(12.0),
              bottom: Radius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
                    child: Icon(
                      widget.example.icon,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.example.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.example.description,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  _buildActionButtons(context),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: _buildCodeViewer(),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(_isExpanded ? Icons.code_off : Icons.code),
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          tooltip: _isExpanded ? 'Hide code' : 'View code',
          color: Theme.of(context).primaryColor,
        ),
        IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () {
            Navigator.of(context).pushNamed(widget.example.route);
          },
          tooltip: 'Run example',
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }

  Widget _buildCodeViewer() {
    return Container(
      height: 400,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12.0),
        ),
        child: CodeViewer(
          codeUrl: widget.example.codeUrl,
        ),
      ),
    );
  }
}