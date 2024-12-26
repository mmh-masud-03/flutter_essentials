import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = await openDatabase(
    join(await getDatabasesPath(), 'example.db'),
    onCreate: (db, version) {
      return db.execute('CREATE TABLE items(id INTEGER PRIMARY KEY, name TEXT)');
    },
    version: 1,
  );

  runApp(MyApp(database: database));
}

class MyApp extends StatelessWidget {
  final Database database;
  const MyApp({required this.database, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQLite Example',
      home: DatabaseScreen(database: database),
    );
  }
}

class DatabaseScreen extends StatelessWidget {
  final Database database;
  const DatabaseScreen({required this.database, super.key});

  Future<void> insertItem() async {
    await database.insert('items', {'name': 'Sample Item'});
  }

  Future<List<Map<String, dynamic>>> getItems() async {
    return await database.query('items');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SQLite Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await insertItem();
            final items = await getItems();
            print(items);
          },
          child: const Text('Insert Item'),
        ),
      ),
    );
  }
}
