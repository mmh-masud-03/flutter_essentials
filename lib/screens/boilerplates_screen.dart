import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';

class BoilerplatesScreen extends StatelessWidget {
  const BoilerplatesScreen({super.key});

  List<Widget> _buildBoilerplateSections(BuildContext context) {
    return [
      _buildDrawerBoilerplate(context),
      const SizedBox(height: 20),
      _buildBottomNavBoilerplate(context),
      const SizedBox(height: 20),
      _buildLocalDatabaseBoilerplate(context),
      const SizedBox(height: 20),
      _buildStateManagementBoilerplate(context),
      const SizedBox(height: 20),
      _buildAsyncStateManagementBoilerplate(context),
      const SizedBox(height: 20),
      _buildNotifierBoilerplate(context),
    ];
  }

  Widget _buildStateManagementBoilerplate(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'State Management (StateProvider)',
      widget: const Text(
        'A simple counter app demonstrating state management using Riverpod.',
        style: TextStyle(fontSize: 16),
      ),
      description:
      'Learn how to manage simple states using Riverpod’s StateProvider.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/counter_riverpod.dart"
    );
  }

  Widget _buildAsyncStateManagementBoilerplate(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Async State Management (FutureProvider)',
      widget: const Text(
        'A boilerplate to manage asynchronous data with Riverpod.',
        style: TextStyle(fontSize: 16),
      ),
      description:
      'Fetch data from an API or perform long-running tasks using FutureProvider.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/future_provider.dart"
    );
  }

  Widget _buildNotifierBoilerplate(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Complex State Management (NotifierProvider)',
      widget: const Text(
        'Manage complex states and business logic with NotifierProvider.',
        style: TextStyle(fontSize: 16),
      ),
      description:
      'A comprehensive example of Riverpod’s NotifierProvider for advanced state management.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/notifier_provider.dart"
    );
  }
Widget _buildDrawerBoilerplate(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Drawer',
      widget: const Text(
        'A boilerplate to create a drawer in Flutter.',
        style: TextStyle(fontSize: 16),
      ),
      description:
      'Learn how to create a drawer in Flutter and navigate between screens.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/drawer.dart"
    );
  }

  Widget _buildBottomNavBoilerplate(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Bottom Navigation',
      widget: const Text(
        'A boilerplate to create a bottom navigation bar in Flutter.',
        style: TextStyle(fontSize: 16),
      ),
      description:
      'Learn how to create a bottom navigation bar in Flutter and navigate between screens.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/bottom_nav.dart"
    );
  }
  Widget _buildLocalDatabaseBoilerplate(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Local Database',
      widget: const Text(
        'A boilerplate to create a local database in Flutter.',
        style: TextStyle(fontSize: 16),
      ),
      description:
      'Learn how to create a local database in Flutter and perform CRUD operations.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/local_db.txt"
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boilerplates'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
        child: ListView(
          children: _buildBoilerplateSections(context),
        ),
      ),
    );
  }
}
