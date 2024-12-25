import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CodeFetcher extends StatefulWidget {
  final String codeUrl;
  final Duration timeout;
  final Widget? loadingWidget;
  final Widget Function(String error)? errorBuilder;

  const CodeFetcher({
    super.key,
    required this.codeUrl,
    this.timeout = const Duration(seconds: 10),
    this.loadingWidget,
    this.errorBuilder,
  });

  @override
  State<CodeFetcher> createState() => _CodeFetcherState();
}

class _CodeFetcherState extends State<CodeFetcher> {
  late Future<String> _codeFuture;

  @override
  void initState() {
    super.initState();
    _codeFuture = _fetchCode();
  }

  @override
  void didUpdateWidget(CodeFetcher oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.codeUrl != widget.codeUrl) {
      _codeFuture = _fetchCode();
    }
  }

  Future<String> _fetchCode() async {
    try {
      final response = await http
          .get(Uri.parse(widget.codeUrl))
          .timeout(widget.timeout);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw HttpException(
          'Failed to load code. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Failed to fetch code: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _codeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return widget.loadingWidget ??
              const Center(
                child: CircularProgressIndicator(),
              );
        }

        if (snapshot.hasError) {
          return widget.errorBuilder?.call(snapshot.error.toString()) ??
              Center(
                child: Text(
                  'Error: ${snapshot.error}',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              );
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SelectableText(
              snapshot.data ?? '',
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 14,
              ),
            ),
          ),
        );
      },
    );
  }
}