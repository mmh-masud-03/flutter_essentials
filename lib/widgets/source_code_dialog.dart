import 'package:flutter/material.dart';
import 'package:flutter_essentials/core/utils/formatter.dart';
import 'package:flutter_essentials/widgets/code_viewer.dart';
import 'package:flutter_essentials/widgets/copy_button.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceCodeDialog{
  static void showCodeDialog(
      BuildContext context,
      String codeUrl,
      String title,
      ) {
    final screenSize = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        backgroundColor: Colors.transparent,
        child: Container(
          width: screenSize.width * 0.92,
          height: screenSize.height * 0.85,
          decoration: BoxDecoration(
            color: theme.dialogBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildDialogHeader(context, title),
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  child: CodeViewer(codeUrl: codeUrl),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildDialogHeader(BuildContext context, String title) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Source Code - $title',
              maxLines: 2,
              style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
              ),
            ),
          ),
          Material(
            color: Colors.transparent,
            child: IconButton(
              icon: Icon(Icons.close, color: theme.colorScheme.onPrimary),
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Close',
              splashRadius: 24,
            ),
          ),
        ],
      ),
    );
  }
}