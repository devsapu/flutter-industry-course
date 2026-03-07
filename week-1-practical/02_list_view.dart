// Copy this entire file into lib/main.dart
// Example: ListView – scrollable list of items

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 1 – ListView',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const ListViewExample(),
    );
  }
}

class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Task 1'), leading: Icon(Icons.check_circle_outline)),
          ListTile(title: Text('Task 2'), leading: Icon(Icons.check_circle_outline)),
          ListTile(title: Text('Task 3'), leading: Icon(Icons.check_circle_outline)),
          ListTile(title: Text('Task 4'), leading: Icon(Icons.check_circle_outline)),
          ListTile(title: Text('Task 5'), leading: Icon(Icons.check_circle_outline)),
        ],
      ),
    );
  }
}
