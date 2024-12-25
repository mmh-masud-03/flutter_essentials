import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/ui_widgets/switch_widget.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';
import 'package:flutter_essentials/features/ui_widgets/card_widget.dart';
import 'package:flutter_essentials/features/ui_widgets/custom_button.dart';
import 'package:flutter_essentials/features/ui_widgets/text_field_widget.dart';

class UIWidgetsScreen extends StatelessWidget {
  const UIWidgetsScreen({Key? key}) : super(key: key);

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
          children: [
            ExpandableSection.buildExpandableSection(
              context,
              title: 'Custom Button',
              widget: CustomButton(
                label: 'Click Me',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Button Pressed')),
                  );
                },
              ),
              description:
                  'A customizable button widget that triggers an action when clicked.',
              sourceCode: '''CustomButton(
  label: 'Click Me',
  onPressed: () {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Button Pressed')),
    );
  },
)''',
            ),
            const SizedBox(height: 20),
            ExpandableSection.buildExpandableSection(
              context,
              title: 'Custom Card',
              widget: CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('This is a custom card.',
                        style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text('Add any content you want here.',
                        style: TextStyle(fontSize: 14)),
                  ],
                ),
              ),
              description:
                  'A customizable card widget with padding and elevation.',
              sourceCode: '''CustomCard(
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
)''',
            ),
            const SizedBox(height: 20),
            ExpandableSection.buildExpandableSection(
              context,
              title: 'Custom Text Field',
              widget: CustomTextField(
                label: 'Enter Text',
                hintText: 'Type something...',
              ),
              description:
                  'A text input field with customizable label and hint.',
              sourceCode: '''CustomTextField(
  label: 'Enter Text',
  hintText: 'Type something...',
)''',
            ),
            const SizedBox(height: 20),
            ExpandableSection.buildExpandableSection(
              context,
              title: 'Switch Button',
              widget: CustomSwitch(),
              description:
              'A toggle switch button',
              sourceCode: '''import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({Key? key}) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Toggle Switch',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Switch(
          value: _isOn,
          onChanged: (value) {
            setState(() {
              _isOn = value;
            });
          },
        ),
      ],
    );
  }
}
''',
            ),
          ],
        ),
      ),
    );
  }
}
