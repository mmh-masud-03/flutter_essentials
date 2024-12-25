
// expandable_section.dart (updated)
import 'package:flutter/material.dart';
import 'package:flutter_essentials/widgets/code_viewer.dart';

class ExpandableSection {
  static Widget buildExpandableSection(
      BuildContext context, {
        required String title,
        required Widget widget,
        required String description,
        required String codeUrl,
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
                onPressed: () => _showCodeDialog(context, codeUrl, title),
                child: const Text('View Source Code'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static void _showCodeDialog(
      BuildContext context,
      String codeUrl,
      String title,
      ) {
    final screenSize = MediaQuery.of(context).size;

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        child: Container(
          width: screenSize.width * 0.92,
          height: screenSize.height * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDialogHeader(context, title),
              Expanded(
                child: CodeViewer(codeUrl: codeUrl),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildDialogHeader(BuildContext context, String title) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(  // Added Expanded widget
            child: Text(
              'Source Code - $title',
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,  // Changed to ellipsis
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}