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
      codeUrl: ''
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
      codeUrl: ' '
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
      codeUrl: ' '
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
      codeUrl: ' '
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
