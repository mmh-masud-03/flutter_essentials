import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostMethodExample extends StatefulWidget {
  const PostMethodExample({super.key});

  @override
  _PostMethodExampleState createState() => _PostMethodExampleState();
}

class _PostMethodExampleState extends State<PostMethodExample> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<void> createPost() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'title': 'New Post', 'body': 'This is a post'}),
      );
      if (response.statusCode == 201) {
        print('Post created: ${response.body}');
      } else {
        throw Exception('Failed to create post');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('POST Method Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: createPost,
          child: const Text('Create Post'),
        ),
      ),
    );
  }
}
