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
import 'package:flutter_essentials/features/ui_widgets/speed_dial_fab.dart';
import 'package:flutter_essentials/features/ui_widgets/stepper.dart';
import 'package:flutter_essentials/features/ui_widgets/switch_widget.dart';
import 'package:flutter_essentials/features/ui_widgets/text_field_widget.dart';
import 'package:flutter_essentials/features/ui_widgets/toast_message.dart';
import 'package:flutter_essentials/widgets/expendable_section.dart';

import '../features/ui_widgets/search_bar.dart';
import '../features/ui_widgets/skeleton_loading.dart';
import '../features/ui_widgets/tag_input.dart';

class UIWidgetsScreen extends StatelessWidget {
  const UIWidgetsScreen({super.key});

  List<Widget> _buildWidgetSections(BuildContext context) {
    return [
      _buildButtonSection(context),
      const SizedBox(height: 20),
      _buildCardSection(context),
      const SizedBox(height: 20),
      _buildTextFieldSection(context),
      const SizedBox(height: 20),
      _buildSwitchSection(context),
      const SizedBox(height: 20),
      _buildDropdownSection(context),
      const SizedBox(height: 20),
      _buildDatePickerSection(context),
      const SizedBox(height: 20),
      _buildRatingBarSection(context),
      const SizedBox(height: 20),
      _buildAvatarSection(context),
      const SizedBox(height: 20),
      _buildBadgeSection(context),
      const SizedBox(height: 20),
      _buildChipSection(context),
      const SizedBox(height: 20),
      _buildSliderSection(context),
      const SizedBox(height: 20),
      _buildProgressIndicatorSection(context),
      const SizedBox(height: 20),
      _buildRadioButtonGroupSection(context),
      const SizedBox(height: 20),
      _buildStepperSection(context),
      const SizedBox(height: 20),
      _buildSwitchSection(context),
      const SizedBox(height: 20),
      _buildToastSection(context),
      const SizedBox(height: 20),
      _buildAccordionSection(context),
      const SizedBox(height: 20),
      _buildSearchBarSection(context),
      const SizedBox(height: 20),
      _buildSpeedDialFabSection(context),
      const SizedBox(height: 20),
      _buildSkeletonLoaderSection(context),
      const SizedBox(height: 20),
      _buildTagInputSection(context),
      const SizedBox(height: 20),
      _buildCustomColorPickerSection(context),
      const SizedBox(height: 20),
      _buildFileUploadButtonSection(context),
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
      codeUrl: ' '
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
      codeUrl: ' '
    );
  }
  
  Widget _buildSkeletonLoaderSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'Skeleton Loader',
      widget: SkeletonLoading(width: 200, height: 200,),
      description: 'A skeleton loader widget.',
      codeUrl: ' '
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
      codeUrl: ' '
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
      codeUrl: ' '
    );
  }
  Widget _buildFileUploadButtonSection(BuildContext context) {
    return ExpandableSection.buildExpandableSection(
      context,
      title: 'File Upload Button',
      widget: FileUploadButton()
          ,
      description: 'A button widget for uploading files.',
      codeUrl: ' '
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
