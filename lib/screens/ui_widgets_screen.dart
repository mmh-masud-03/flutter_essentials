import 'package:flutter/material.dart';
import 'package:flutter_essentials/features/ui_widgets/accordion.dart';
import 'package:flutter_essentials/features/ui_widgets/badge.dart';
import 'package:flutter_essentials/features/ui_widgets/card_widget.dart';
import 'package:flutter_essentials/features/ui_widgets/circle_avatar.dart';
import 'package:flutter_essentials/features/ui_widgets/color_picker.dart';
import 'package:flutter_essentials/features/ui_widgets/custom_button.dart';
import 'package:flutter_essentials/features/ui_widgets/custom_chip.dart';
import 'package:flutter_essentials/features/ui_widgets/custom_slider.dart';
import 'package:flutter_essentials/features/ui_widgets/date_picker.dart';
import 'package:flutter_essentials/features/ui_widgets/dropdown.dart';
import 'package:flutter_essentials/features/ui_widgets/file_upload_button.dart';
import 'package:flutter_essentials/features/ui_widgets/progress_indicator.dart';
import 'package:flutter_essentials/features/ui_widgets/radio_button_group.dart';
import 'package:flutter_essentials/features/ui_widgets/rating_bar.dart';
import 'package:flutter_essentials/features/ui_widgets/search_bar.dart';
import 'package:flutter_essentials/features/ui_widgets/skeleton_loading.dart';
import 'package:flutter_essentials/features/ui_widgets/speed_dial_fab.dart';
import 'package:flutter_essentials/features/ui_widgets/stepper.dart';
import 'package:flutter_essentials/features/ui_widgets/switch_widget.dart';
import 'package:flutter_essentials/features/ui_widgets/tag_input.dart';
import 'package:flutter_essentials/features/ui_widgets/text_field_widget.dart';
import 'package:flutter_essentials/features/ui_widgets/toast_message.dart';

import '../widgets/source_code_dialog.dart';

class UIWidgetsScreen extends StatefulWidget {
  const UIWidgetsScreen({super.key});

  @override
  State<UIWidgetsScreen> createState() => _UIWidgetsScreenState();
}

class _UIWidgetsScreenState extends State<UIWidgetsScreen> {
  final ScrollController _scrollController = ScrollController();
  String _searchQuery = '';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Widget> _buildWidgetSections(BuildContext context) {
    final sections = [
      _buildSection(
        context: context,
        title: 'Buttons & Inputs',
        widgets: [
          _buildButtonSection(context),
          _buildTextFieldSection(context),
          _buildFileUploadButtonSection(context),
        ],
      ),
      _buildSection(
        context: context,
        title: 'Selection & Pickers',
        widgets: [
          _buildDropdownSection(context),
          _buildDatePickerSection(context),
          _buildCustomColorPickerSection(context),
          _buildRadioButtonGroupSection(context),
        ],
      ),
      _buildSection(
        context: context,
        title: 'Display Components',
        widgets: [
          _buildCardSection(context),
          _buildAvatarSection(context),
          _buildBadgeSection(context),
          _buildChipSection(context),
          _buildSkeletonLoaderSection(context),
        ],
      ),
      _buildSection(
        context: context,
        title: 'Interactive Elements',
        widgets: [
          _buildSliderSection(context),
          _buildSwitchSection(context),
          _buildRatingBarSection(context),
          _buildAccordionSection(context),
        ],
      ),
      _buildSection(
        context: context,
        title: 'Progress & Status',
        widgets: [
          _buildProgressIndicatorSection(context),
          _buildStepperSection(context),
          _buildToastSection(context),
        ],
      ),
      _buildSection(
        context: context,
        title: 'Advanced Components',
        widgets: [
          _buildSearchBarSection(context),
          _buildSpeedDialFabSection(context),
          _buildTagInputSection(context),
        ],
      ),
    ];

    if (_searchQuery.isEmpty) {
      return sections;
    }

    return sections.map((section) {
      if (section is Column) {
        final title = (section.children[0] as Text).data?.toLowerCase() ?? '';
        if (title.contains(_searchQuery.toLowerCase())) {
          return section;
        }
        final widgets = (section.children[1] as Column).children;
        final filteredWidgets = widgets.where((widget) {
          if (widget is ExpandableSection) {
            return widget.title.toLowerCase().contains(_searchQuery.toLowerCase());
          }
          return false;
        }).toList();
        if (filteredWidgets.isEmpty) return const SizedBox();
        return _buildSection(
          context: context,
          title: title,
          widgets: filteredWidgets,
        );
      }
      return const SizedBox();
    }).where((widget) => widget is! SizedBox).toList();
  }

  Widget _buildSection({
    required BuildContext context,
    required String title,
    required List<Widget> widgets,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Column(
          children: widgets.map((widget) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: widget,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildButtonSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Button',
      widget: Column(
        children: [
          CustomButton(
            label: 'Primary Button',
            onPressed: () => _showSnackBar(context, 'Primary Button Pressed'),
          ),
          const SizedBox(height: 8),
          CustomButton(
            label: 'Secondary Button',
            // variant: ButtonVariant.secondary,
            //make the design of the button secondary
            color: Colors.blue[400],

            onPressed: () => _showSnackBar(context, 'Secondary Button Pressed'),
          ),
          const SizedBox(height: 8),
          CustomButton(
            label: 'Outlined Button',
            color: Colors.transparent,
            // variant: ButtonVariant.outlined,
            onPressed: () => _showSnackBar(context, 'Outlined Button Pressed'),
          ),
        ],
      ),
      description: 'Customizable buttons with different variants and styles.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_button.dart',
    );
  }

  // ... [Rest of the individual section builders remain the same]

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('UI Components'),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomSearchBar(
              onChanged: (value) {
                // setState(() {
                //   _searchQuery = "$value";
                // });
              },
            ),
          ),
        ),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(
          cardTheme: CardTheme(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            children: _buildWidgetSections(context),
          ),
        ),
      ),
      floatingActionButton: SpeedDialFAB(
        items: [
          SpeedDialItem(
            label: 'Scroll to Top',
            icon: Icons.arrow_upward,
            onTap: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
          SpeedDialItem(
            label: 'Reset Search',
            icon: Icons.clear,
            onTap: () {
              setState(() {
                _searchQuery = '';
              });
            },
          ),
        ],
      ),
    );
  }
}

// Add these enums and classes if they don't exist
enum ButtonVariant {
  primary,
  secondary,
  outlined,
}

class ExpandableSection extends StatelessWidget {
  final String title;
  final Widget widget;
  final String description;
  final String codeUrl;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.widget,
    required this.description,
    required this.codeUrl,
  });

  static Widget buildExpandableSection(
      BuildContext context, {
        required String title,
        required Widget widget,
        required String description,
        required String codeUrl,
      }) {
    return ExpandableSection(
      title: title,
      widget: widget,
      description: description,
      codeUrl: codeUrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ExpansionTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget,
                const SizedBox(height: 16),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    SourceCodeDialog.showCodeDialog(
                      context,
                      codeUrl,
                      title,
                    );                  },
                  child: const Text('View Source Code'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildButtonSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
    context,
    title: 'Custom Button',
    widget: CustomButton(
      label: 'Click Me',
      onPressed: () => _showSnackBar(context, 'Button Pressed'),
    ),
    description:
    'A customizable button widget that triggers an action when clicked.',
    codeUrl:
    'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_button.dart',
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
    codeUrl:
    "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/card_widget.dart",
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
    codeUrl:
    "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/text_field_widget.dart",
  );
}

Widget _buildSwitchSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
    context,
    title: 'Switch Button',
    widget: const CustomSwitch(),
    description: 'A toggle switch button.',
    codeUrl:
    "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/switch_widget.dart",
  );
}

Widget _buildBadgeSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Badge',
      widget: CustomBadge(text: "Custom Badge"),
      description: 'A custom badge.',
      codeUrl:"https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/badge.dart"
  );
}

Widget _buildChipSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(context,
      title: 'Custom Chip',
      widget: CustomChip(label: "Custom Chip"),
      description: 'A Custom Chip.',
      codeUrl:
      "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_chip.dart");
}

Widget _buildSliderSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Slider',
      widget: CustomSlider(
          min: 10, max: 100, initialValue: 20, onChanged: (value) {}),
      description: 'A Custom Slider.',
      codeUrl:"https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/custom_slider.dart"
  );
}

Widget _buildProgressIndicatorSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Progress Indicator',
      widget: CustomProgressIndicator(progress: 0.2),
      description: 'A Custom Progress Indicator.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/progress_indicator.dart"
  );
}

Widget _buildRadioButtonGroupSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Radio Button Group',
      widget: CustomRadioGroup(
          groupLabel: "Radio Group",
          options: ['Option 1', 'Option 2', 'Option 3'],
          onChanged: (value) {}),
      description: 'A Custom Radio Button Group.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/radio_button_group.dart"
  );
}

Widget _buildStepperSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Stepper',
      widget: CustomStepper(
          currentStep: 2, steps: ['0', '4', '8'], onStepTapped: (v) {}),
      description: 'A Custom Stepper.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/stepper.dart"
  );
}

Widget _buildDropdownSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Dropdown',
      widget: CustomDropdown(
        hint: 'Choose an option',
        items: ['Option 1', 'Option 2', 'Option 3'],
        selectedValue: null,
        onChanged: (value) {
          _showSnackBar(context, 'Selected: $value');
        },
      ),
      description: 'A dropdown menu to select an option.',
      codeUrl:"https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/dropdown.dart"
  );
}

Widget _buildDatePickerSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Date Picker',
      widget: CustomDatePicker(
        label: 'Select Date',
        onDateSelected: (date) {
          _showSnackBar(context, 'Selected Date: $date');
        },
      ),
      description: 'A date picker widget for selecting dates.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/date_picker.dart"
  );
}

Widget _buildRatingBarSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Rating Bar',
      widget: CustomRatingBar(
        maxStars: 5,
        initialRating: 3,
        onRatingChanged: (rating) {
          _showSnackBar(context, 'Rating: $rating');
        },
      ),
      description: 'A rating bar with customizable stars.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/rating_bar.dart"
  );
}

Widget _buildAvatarSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Avatar',
      widget: CustomAvatar(
        imageUrl: 'https://via.placeholder.com/150',
        radius: 40,
      ),
      description: 'A circular avatar with an image.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/circle_avatar.dart"
  );
}
Widget _buildToastSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Toast',
      widget: CustomToast(message: 'This is a custom toast message.'),
      description: 'A custom toast message.',
      codeUrl: "https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/toast_message.dart"
  );
}

Widget _buildAccordionSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Accordion',
      widget: CustomAccordion(title: "Accordion", content: Container(
        child: Text("This is an accordion widget."),

      )),
      description: 'A collapsible accordion widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/accordion.dart'
  );
}

Widget _buildSearchBarSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Search Bar',
      widget: CustomSearchBar(
        onChanged: (value) {
          _showSnackBar(context, 'Searching for: $value');
        },
      ),
      description: 'A search bar widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/search_bar.dart'
  );
}
Widget _buildSpeedDialFabSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Speed Dial FAB',
      widget: SpeedDialFAB(items: [
        //each item contain label, icon and onPressed function
        SpeedDialItem(label: 'Item 1', icon: Icons.ac_unit, onTap: () {}),
        SpeedDialItem(label: 'Item 2', icon: Icons.access_alarm, onTap: () {}),
        SpeedDialItem(label: 'Item 3', icon: Icons.access_time, onTap: () {}),

      ]),
      description: 'A floating action button with speed dial options.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/speed_dial_fab.dart'
  );
}

Widget _buildSkeletonLoaderSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Skeleton Loader',
      widget: SkeletonLoading(width: 200, height: 200,),
      description: 'A skeleton loader widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/skeleton_loading.dart'
  );
}
Widget _buildTagInputSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Tag Input',
      widget: TagInput(
        tags: ['Tag 1', 'Tag 2', 'Tag 3'], onTagsChanged: (List<String> value) {
        _showSnackBar(context, 'Tags: ${value.join(', ')}');

      },


      ),
      description: 'A tag input widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/tag_input.dart'
  );
}

Widget _buildCustomColorPickerSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'Custom Color Picker',
      widget: CustomColorPicker(selectedColor: Colors.blue , onColorChanged: (color) {
        _showSnackBar(context, 'Selected Color: $color');
      }),
      description: 'A custom color picker widget.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/color_picker.dart'
  );
}
Widget _buildFileUploadButtonSection(BuildContext context) {
  return ExpandableSection.buildExpandableSection(
      context,
      title: 'File Upload Button',
      widget: FileUploadButton()
      ,
      description: 'A button widget for uploading files.',
      codeUrl: 'https://github.com/mmh-masud-03/flutter_essentials/raw/refs/heads/master/lib/features/ui_widgets/file_upload_button.dart'
  );
}
void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}

void _handleTextChange(BuildContext context, String value) {
  // Add text field change handling logic here
}
