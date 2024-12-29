import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';

class ExamplesScreen extends StatelessWidget {
  const ExamplesScreen({super.key});

  List<Widget> _buildExampleSections(BuildContext context) {
    return [
      _buildFormeSection(context),
      const SizedBox(height: 20),
      _buildGridSection(context),
      const SizedBox(height: 20),
      _buildListSection(context),
      const SizedBox(height: 20),
      _buildCarouselSection(context),
      const SizedBox(height: 20),
      _buildTabsSection(context),
      const SizedBox(height: 20),
      _buildSliversSection(context),
      const SizedBox(height: 20),
      _buildChartsSection(context),
      const SizedBox(height: 20),
      _buildDragAndDropSection(context),
      const SizedBox(height: 20),
      _buildBottomBarSection(context),

    ];
  }
Widget _buildFormeSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Form',
      widget:
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.blue,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/form-screen');
          },
          child: const Text('Open Form'),
        ),
      description: 'Create a form with validation and submission.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/form.dart'
    );
  }

  Widget _buildGridSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Grid',
      widget:
          // a button to open the grid screen
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/grid-screen');
            },
            child: const Text('Open Grid'),
          ),
      description: 'Create a grid of items using GridView.builder.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/grid.dart'
    );
  }
  Widget _buildListSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'List',
      widget:
          // a button to open the list screen
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/list-screen');
            },
            child: const Text('Open List'),
          ),
      description: 'Create a list of items using ListView.builder.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/list.dart'
    );
  }
  Widget _buildCarouselSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Carousel',
      widget:
          // a button to open the carousel screen
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/carousel-screen');
            },
            child: const Text('Open Carousel'),
          ),
      description: 'Create a carousel of images using CarouselSlider.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/carousel.dart'
    );
  }
  Widget _buildTabsSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Tabs',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/tabs-screen');
        },
        child: const Text('Open Tabs'),
      ),
      description: 'Implement tab navigation with TabBar and TabBarView.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/tabs.dart',
    );
  }
  Widget _buildSliversSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Slivers',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/slivers-screen');
        },
        child: const Text('Open Slivers'),
      ),
      description: 'Learn about SliverAppBar, SliverList, and SliverGrid.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/silvers.dart',
    );
  }
  Widget _buildChartsSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Charts',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/charts-screen');
        },
        child: const Text('Open Charts'),
      ),
      description: 'Visualize data using bar, line, and pie charts.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/charts.dart',
    );
  }
  Widget _buildDragAndDropSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Drag and Drop',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/drag-and-drop-screen');
        },
        child: const Text('Open Drag & Drop'),
      ),
      description: 'Explore drag-and-drop functionality in Flutter.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/drag_and_drop.dart',
    );
  }
  Widget _buildBottomBarSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Bottom Bar',
      widget: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/bottom-bar');
        },
        child: const Text('Open Bottom Bar'),
      ),
      description: 'Create a bottom app bar with a floating action button.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/examples/bottom_bar.dart',
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examples'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _buildExampleSections(context),
        ),
      ),
    );
  }
}
