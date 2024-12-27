import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';

class ApiMethodsScreen extends StatelessWidget {
  const ApiMethodsScreen({super.key});

  List<Widget> _buildApiMethodSections(BuildContext context) {
    return [
      _buildGetMethodSection(context),
      const SizedBox(height: 20),
      _buildPostMethodSection(context),
      const SizedBox(height: 20),
      _buildPutMethodSection(context),
      const SizedBox(height: 20),
      _buildPatchMethodSection(context),
      const SizedBox(height: 20),
      _buildDeleteMethodSection(context),
    ];
  }

  Widget _buildGetMethodSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'GET Method',
      widget: const Text(
        'Fetch data from an API using the GET method.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Retrieve data from the server using the GET method.',
      codeUrl:
      'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_methods/get_method_example.dart',
    );
  }

  Widget _buildPostMethodSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'POST Method',
      widget: const Text(
        'Send data to the server using the POST method.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Create new data on the server using the POST method.',
      codeUrl:
      'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_methods/post_method_example.dart',
    );
  }

  Widget _buildPutMethodSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'PUT Method',
      widget: const Text(
        'Update existing data on the server using the PUT method.',
        style: TextStyle(fontSize: 16),
      ),
      description:
      'Replace the entire data resource on the server using the PUT method.',
      codeUrl:
      'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_methods/put_method_example.dart',
    );
  }

  Widget _buildPatchMethodSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'PATCH Method',
      widget: const Text(
        'Partially update data on the server using the PATCH method.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Modify specific fields in a data resource using PATCH.',
      codeUrl:
      'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_methods/patch_method_example.dart',
    );
  }

  Widget _buildDeleteMethodSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'DELETE Method',
      widget: const Text(
        'Delete a resource from the server using the DELETE method.',
        style: TextStyle(fontSize: 16),
      ),
      description: 'Remove data from the server using the DELETE method.',
      codeUrl:
      'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/api_methods/delete_method_example.dart',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Methods'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _buildApiMethodSections(context),
        ),
      ),
    );
  }
}
