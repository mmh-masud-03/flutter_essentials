import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/source_code_dialog.dart';

class ExpandableSection{
  static Widget buildExpandableSection(
      BuildContext context, {
        required String title,
        required Widget widget,
        required String description,
        required String sourceCode,
      }) {
    return ExpansionTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(description),
              const SizedBox(height: 10),
              widget,
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  SourceCodeDialog.showSourceCodeDialog(context, sourceCode);
                  //_showSourceCodeDialog(context, sourceCode);
                },
                child: const Text('View Source Code'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}