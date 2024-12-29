// File Upload Button
import 'package:flutter/material.dart';

class FileUploadButton extends StatefulWidget {
  final String label;
  final ValueChanged<String>? onFileSelected;
  final List<String>? allowedExtensions;

  const FileUploadButton({
    Key? key,
    this.label = 'Upload File',
    this.onFileSelected,
    this.allowedExtensions,
  }) : super(key: key);

  @override
  State<FileUploadButton> createState() => _FileUploadButtonState();
}

class _FileUploadButtonState extends State<FileUploadButton> {
  String? _fileName;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        ElevatedButton.icon(
        onPressed: () {
      // Implement file picking logic here
      // This is a placeholder for demonstration
      setState(() {
        _fileName = 'example.pdf';
      });
      if (widget.onFileSelected != null) {
        widget.onFileSelected!(_fileName!);
      }
    },
    icon: const Icon(Icons.upload_file),
    label: Text(widget. label),
    ),
    if (_fileName != null) Text(_fileName!),
    ],
    );
  }
}