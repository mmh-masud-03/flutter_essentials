import 'package:flutter/material.dart';

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
