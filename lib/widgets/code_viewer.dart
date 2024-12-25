import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class CodeViewer extends StatefulWidget {
  final String codeUrl;
  final Duration timeout;

  const CodeViewer({
    super.key,
    required this.codeUrl,
    this.timeout = const Duration(seconds: 10),
  });

  @override
  State<CodeViewer> createState() => _CodeViewerState();
}

class _CodeViewerState extends State<CodeViewer> {
  late Future<String> _codeFuture;

  @override
  void initState() {
    super.initState();
    _codeFuture = _fetchAndFormatCode();
  }

  @override
  void didUpdateWidget(CodeViewer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.codeUrl != widget.codeUrl) {
      _codeFuture = _fetchAndFormatCode();
    }
  }

  Future<String> _fetchAndFormatCode() async {
    try {
      final response = await http
          .get(Uri.parse(widget.codeUrl))
          .timeout(widget.timeout);

      if (response.statusCode == 200) {
        return _formatDartCode(response.body);
      } else {
        throw HttpException(
          'Failed to load code. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch code: $e');
    }
  }

  String _formatDartCode(String code) {
    // Basic formatting - you can enhance this based on your needs
    return code
        .replaceAll('\t', '  ')  // Replace tabs with spaces
        .trim();  // Remove extra whitespace
  }

  Future<void> _copyToClipboard(String code) async {
    await Clipboard.setData(ClipboardData(text: code));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Code copied to clipboard'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _codeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Theme.of(context).colorScheme.error,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  'Error loading code:\n${snapshot.error}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _codeFuture = _fetchAndFormatCode();
                    });
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        final code = snapshot.data ?? '';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildToolbar(code),
            Expanded(
              child: _buildCodeView(code),
            ),
          ],
        );
      },
    );
  }

  Widget _buildToolbar(String code) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            icon: const Icon(Icons.copy),
            tooltip: 'Copy code',
            onPressed: () => _copyToClipboard(code),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reload code',
            onPressed: () {
              setState(() {
                _codeFuture = _fetchAndFormatCode();
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCodeView(String code) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: HighlightView(
          code,
          language: 'dart',
          theme: githubTheme,
          padding: const EdgeInsets.all(16),
          textStyle: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
