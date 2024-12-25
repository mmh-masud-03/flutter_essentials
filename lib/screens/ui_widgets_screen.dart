import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/ui_widgets/switch_widget.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';
import 'package:flutter_essentials/features/ui_widgets/card_widget.dart';
import 'package:flutter_essentials/features/ui_widgets/custom_button.dart';
import 'package:flutter_essentials/features/ui_widgets/text_field_widget.dart';

class UIWidgetsScreen extends StatelessWidget {
  const UIWidgetsScreen({super.key});

  // Extract widget sections to improve readability and maintainability
  List<Widget> _buildWidgetSections(BuildContext context) {
    return [
      _buildButtonSection(context),
      const SizedBox(height: 20),
      _buildCardSection(context),
      const SizedBox(height: 20),
      _buildTextFieldSection(context),
      const SizedBox(height: 20),
      _buildSwitchSection(context),
    ];
  }

  Widget _buildButtonSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Button',
      widget: CustomButton(
        label: 'Click Me',
        onPressed: () => _showSnackBar(context, 'Button Pressed'),
      ),
      description: 'A customizable button widget that triggers an action when clicked.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_button.dart',

    );
  }

  Widget _buildCardSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Card',
      widget: CustomCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'This is a custom card.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              'Add any content you want here.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      description: 'A customizable card widget with padding and elevation.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_button.dart',
    );
  }

  Widget _buildTextFieldSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Text Field',
      widget: CustomTextField(
        label: 'Enter Text',
        hintText: 'Type something...',
        onChanged: (value) => _handleTextChange(context, value),
      ),
      description: 'A text input field with customizable label and hint.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_button.dart',
    );
  }

  Widget _buildSwitchSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Switch Button',
      widget: const CustomSwitch(),
      description: 'A toggle switch button',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_button.dart',
    );
  }

  // Helper methods
  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _handleTextChange(BuildContext context, String value) {
    // Add text field change handling logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Widgets'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: _buildWidgetSections(context),
        ),
      ),
    );
  }
}