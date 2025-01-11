import 'package:flutter/material.dart';

class CustomRadioGroup extends StatefulWidget {
  final String groupLabel;
  final List<String> options;
  final ValueChanged<String> onChanged;

  const CustomRadioGroup({
    super.key,
    required this.groupLabel,
    required this.options,
    required this.onChanged,
  });

  @override
  _CustomRadioGroupState createState() => _CustomRadioGroupState();
}

class _CustomRadioGroupState extends State<CustomRadioGroup> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.groupLabel,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        ...widget.options.map((option) {
          return RadioListTile<String>(
            title: Text(option),
            value: option,
            groupValue: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value!;
              });
              widget.onChanged(value!);
            },
          );
        }),
      ],
    );
  }
}
