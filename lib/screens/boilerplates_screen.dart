import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/source_code_dialog.dart';


class BoilerplatesScreen extends StatelessWidget {
  const BoilerplatesScreen({super.key});

  List<Widget> _buildBoilerplateSections(BuildContext context) {
    return [
      _buildHeader(context),
      const SizedBox(height: 24),
      ..._buildCategorizedBoilerplates(context),
    ];
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flutter Boilerplates',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ready-to-use templates to kickstart your development',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCategorizedBoilerplates(BuildContext context) {
    final categories = {
      'Navigation': [
        _buildDrawerBoilerplate(context),
        _buildBottomNavBoilerplate(context),
      ],
      'State Management': [
        _buildStateManagementBoilerplate(context),
        _buildAsyncStateManagementBoilerplate(context),
        _buildNotifierBoilerplate(context),
      ],
      'Data Storage': [
        _buildLocalDatabaseBoilerplate(context),
      ],
    };

    return categories.entries.expand((category) {
      return [
        _buildCategoryHeader(context, category.key),
        ...category.value.map((widget) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: widget,
        )),
        const SizedBox(height: 24),
      ];
    }).toList();
  }

  Widget _buildCategoryHeader(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoilerplateCard(
      BuildContext context, {
        required String title,
        required Widget widget,
        required String description,
        required String codeUrl,
        required IconData icon,
      }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: Theme.of(context).primaryColor),
        ),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          description,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: widget,
                ),
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: () {
                    SourceCodeDialog.showCodeDialog(
                      context,
                      codeUrl,
                      title,
                    );
                  },
                  icon: const Icon(Icons.code),
                  label: const Text('View Code'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    foregroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Update all individual boilerplate methods to use the new card design
  Widget _buildStateManagementBoilerplate(BuildContext context) {
    return _buildBoilerplateCard(
      context,
      title: 'State Management (StateProvider)',
      icon: Icons.data_usage,
      widget: const Text(
        'A simple counter app demonstrating state management using Riverpod.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Learn how to manage simple states using Riverpods StateProvider.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/counter_riverpod.dart",
    );
  }

  // Similarly update other boilerplate methods...



  // (Update the remaining methods following the same pattern, with appropriate icons)

  Widget _buildAsyncStateManagementBoilerplate(BuildContext context) {
    return _buildBoilerplateCard(
      context,
      title: 'Async State Management (FutureProvider)',
      icon: Icons.sync,
      widget: const Text(
        'A boilerplate to manage asynchronous data with Riverpod.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Fetch data from an API or perform long-running tasks using FutureProvider.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/future_provider.dart",
    );
  }
  Widget _buildNotifierBoilerplate(BuildContext context) {
    return _buildBoilerplateCard(
      context,
      title: 'Complex State Management (NotifierProvider)',
      icon: Icons.architecture,
      widget: const Text(
        'Manage complex states and business logic with NotifierProvider.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'A comprehensive example of Riverpods NotifierProvider for advanced state management.',
    codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/notifier_provider.dart",
    );
  }
  Widget _buildDrawerBoilerplate(BuildContext context) {
    return _buildBoilerplateCard(
      context,
      title: 'Drawer',
      icon: Icons.menu,
      widget: const Text(
        'A boilerplate to create a drawer in Flutter.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Learn how to create a drawer in Flutter and navigate between screens.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/drawer.dart",
    );
  }
  Widget _buildBottomNavBoilerplate(BuildContext context) {
    return _buildBoilerplateCard(
      context,
      title: 'Bottom Navigation',
      icon: Icons.navigation,
      widget: const Text(
        'A boilerplate to create a bottom navigation bar in Flutter.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Learn how to create a bottom navigation bar in Flutter and navigate between screens.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/bottom_nav.dart",
    );
  }
  Widget _buildLocalDatabaseBoilerplate(BuildContext context) {
    return _buildBoilerplateCard(
      context,
      title: 'Local Database',
      icon: Icons.storage,
      widget: const Text(
        'A boilerplate to create a local database in Flutter.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Learn how to create a local database in Flutter and perform CRUD operations.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/boilerplates/local_db.txt",
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Boilerplates',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.grey[50],
        child: ListView(
          children: _buildBoilerplateSections(context),
        ),
      ),
    );
  }
}


