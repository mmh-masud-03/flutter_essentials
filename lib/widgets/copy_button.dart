import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton{
  static   Widget buildCopyButton(BuildContext context, String code) {
    return StatefulBuilder(
      builder: (context, setState) {
        return IconButton(
          icon: const Icon(
            Icons.copy,
            color: Colors.white,
          ),
          tooltip: 'Copy code',
          onPressed: () async {
            await Clipboard.setData(ClipboardData(text: code));

            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text('Code copied to clipboard'),
                    ],
                  ),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

}