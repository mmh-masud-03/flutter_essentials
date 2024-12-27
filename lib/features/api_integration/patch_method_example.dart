import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatchMethodExample extends StatefulWidget {
  const PatchMethodExample({super.key});

  @override
  _PatchMethodExampleState createState() => _PatchMethodExampleState();
}

class _PatchMethodExampleState extends State<PatchMethodExample> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<void> patchPost() async {
    try {
      final response = await http.patch(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': 'Partially Updated Title'}),
      );
      if (response.statusCode == 200) {
        print('Post patched: ${response.body}');
      } else {
        throw Exception('Failed to patch post');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PATCH Method Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: patchPost,
          child: const Text('Patch Post'),
        ),
      ),
    );
  }
}
