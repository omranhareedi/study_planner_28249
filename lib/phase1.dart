import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // STATIC Main screen scaffold
    return Scaffold(
      // STATIC Top navigation bar
      appBar: AppBar(title: const Text('My Study Planner')),
      // STATIC Body container and vertical layout
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // STATIC Section heading
            const Text(
              'My Study Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // STATIC Hard-coded study goal card
            const Card(
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('Math'),
                subtitle: Text('4 hours'),
              ),
            ),
            // STATIC 
            const Card(
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('English'),
                subtitle: Text('2 hours'),
              ),
            ),
            // STATIC 
            const Card(
              child: ListTile(
                leading: Icon(Icons.book),
                title: Text('Arabic'),
                subtitle: Text('1 hours'),
              ),
            ),
          ],
        ),
      ),
      // STATIC
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
