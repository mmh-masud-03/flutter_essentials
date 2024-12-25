import 'package:flutter/material.dart';
import 'package:flutter_essentials/core/utils/formatter.dart';
import 'package:flutter_essentials/widgets/copy_button.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class SourceCodeDialog{
  static   void showSourceCodeDialog(BuildContext context, String sourceCode) {
    final screenSize = MediaQuery.of(context).size;
    final formattedCode = Formatter.formatDartCode(sourceCode);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: Container(
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
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
                      Text(
                        'Source Code',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          CopyButton.buildCopyButton(context, formattedCode),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: screenSize.width * 0.85,
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: HighlightView(
                            formattedCode,
                            language: 'dart',
                            theme: githubTheme,
                            padding: const EdgeInsets.all(8),
                            textStyle: const TextStyle(
                              fontFamily: 'Courier',
                              fontSize: 14,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}