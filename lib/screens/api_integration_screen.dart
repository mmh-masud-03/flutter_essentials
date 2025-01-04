import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';

class ApiMethodsScreen extends StatelessWidget {
  const ApiMethodsScreen({super.key});

  List<Widget> _buildApiMethodSections(BuildContext context) {
    return [
      _buildHeader(context),
      const SizedBox(height: 24),
      ..._buildApiMethods(context),
    ];
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'REST API Methods',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Learn how to integrate RESTful API methods in Flutter',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildApiMethods(BuildContext context) {
    final methods = [
      _buildMethodCard(
        context,
        title: 'GET Method',
        icon: Icons.download_rounded,
        color: Colors.blue,
        description: 'Retrieve data from the server using the GET method.',
        widget: _buildMethodContent(
          'GET Request',
          'Used to retrieve data from a server. Safe and idempotent.',
          ['Fetch user profiles', 'Get product listings', 'Retrieve posts'],
        ),
        codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_integration/get_method_example.dart',
      ),
      _buildMethodCard(
        context,
        title: 'POST Method',
        icon: Icons.upload_rounded,
        color: Colors.green,
        description: 'Create new data on the server using the POST method.',
        widget: _buildMethodContent(
          'POST Request',
          'Used to submit data to create a new resource on the server.',
          ['Create new user', 'Submit form data', 'Add new product'],
        ),
        codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_integration/post_method_example.dart',
      ),
      _buildMethodCard(
        context,
        title: 'PUT Method',
        icon: Icons.update_rounded,
        color: Colors.orange,
        description: 'Replace the entire data resource on the server using the PUT method.',
        widget: _buildMethodContent(
          'PUT Request',
          'Used to update or replace an entire resource on the server.',
          ['Update user profile', 'Replace product details', 'Update settings'],
        ),
        codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_integration/put_method_example.dart',
      ),
      _buildMethodCard(
        context,
        title: 'PATCH Method',
        icon: Icons.edit_rounded,
        color: Colors.purple,
        description: 'Modify specific fields in a data resource using PATCH.',
        widget: _buildMethodContent(
          'PATCH Request',
          'Used to make partial modifications to a resource.',
          ['Update user status', 'Modify specific fields', 'Partial updates'],
        ),
        codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_integration/patch_method_example.dart',
      ),
      _buildMethodCard(
        context,
        title: 'DELETE Method',
        icon: Icons.delete_outline_rounded,
        color: Colors.red,
        description: 'Remove data from the server using the DELETE method.',
        widget: _buildMethodContent(
          'DELETE Request',
          'Used to remove a resource from the server.',
          ['Delete user account', 'Remove product', 'Clear data'],
        ),
        codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_integration/delete_method_example.dart',
      ),
    ];

    return methods.map((method) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: method,
    )).toList();
  }

  Widget _buildMethodCard(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required Widget widget,
        required String description,
        required String codeUrl,
      }) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: title,
      widget: widget,
      description: description,
      codeUrl: codeUrl,
      actions: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
      ],
    );
  }

  Widget _buildMethodContent(String title, String description, List<String> examples) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          Text(
            'Common Use Cases:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          ...examples.map((example) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                Icon(Icons.arrow_right, color: Colors.grey[600]),
                const SizedBox(width: 8),
                Text(
                  example,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'API Methods',
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
          children: _buildApiMethodSections(context),
        ),
      ),
    );
  }
}