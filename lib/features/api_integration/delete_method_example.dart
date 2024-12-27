import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DeleteMethodExample extends StatefulWidget {
  const DeleteMethodExample({super.key});

  @override
  _DeleteMethodExampleState createState() => _DeleteMethodExampleState();
}

class _DeleteMethodExampleState extends State<DeleteMethodExample> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';

  Future<void> deletePost() async {
    try {
      final response = await http.delete(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        print('Post deleted');
      } else {
        throw Exception('Failed to delete post');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DELETE Method Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: deletePost,
          child: const Text('Delete Post'),
        ),
      ),
    );
  }
}
