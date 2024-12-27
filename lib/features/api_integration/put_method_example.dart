import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutMethodExample extends StatefulWidget {
  const PutMethodExample({super.key});

  @override
  _PutMethodExampleState createState() => _PutMethodExampleState();
}

class _PutMethodExampleState extends State<PutMethodExample> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<void> updatePost() async {
    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': 'Updated Title', 'body': 'Updated Body'}),
      );
      if (response.statusCode == 200) {
        print('Post updated: ${response.body}');
      } else {
        throw Exception('Failed to update post');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PUT Method Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: updatePost,
          child: const Text('Update Post'),
        ),
      ),
    );
  }
}
