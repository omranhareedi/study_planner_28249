import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // STATIC: Root application setup
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // LOGIC: List of Maps storing study goals in memory
  List<Map<String, dynamic>> goals = [
    {'subject': 'Math', 'hours': 4, 'done': false},
    {'subject': 'English', 'hours': 2, 'done': false},
    {'subject': 'Arabic', 'hours': 1, 'done': false},
  ];

  // LOGIC: Sample subjects cycled through when tapping the + button
  final List<String> _sampleSubjects = [
    'Physics',
    'Biology',
    'History',
    'Database Systems',
  ];

  // LOGIC: Adds a sample goal and updates the UI
  void addSampleGoal() {
    setState(() {
      final subject = _sampleSubjects[goals.length % _sampleSubjects.length];
      goals.add({'subject': subject, 'hours': 2, 'done': false});
    });
  }

  // LOGIC: Toggles the 'done' boolean at the given index
  void toggleGoal(int index) {
    setState(() {
      goals[index]['done'] = !goals[index]['done'];
    });
  }

  // LOGIC: Removes the goal at the given index
  void deleteGoal(int index) {
    setState(() {
      goals.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    // STATIC: Main screen scaffold
    return Scaffold(
      // STATIC: Top navigation bar
      appBar: AppBar(title: const Text('My Study Planner')),
      // STATIC: Body container and vertical layout
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // STATIC: Section heading
            const Text(
              'My Study Goals',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            // STATIC: Dynamic scrollable list of goal cards
            Expanded(
              child: ListView.builder(
                itemCount: goals.length,
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  final bool isDone = goal['done'];

                  return Card(
                    child: ListTile(
                      // CONNECTION: Checkbox toggles goal completion
                      leading: Checkbox(
                        value: isDone,
                        onChanged: (value) => toggleGoal(index),
                      ),
                      title: Text(
                        goal['subject'],
                        style: TextStyle(
                          decoration: isDone
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                          color: isDone ? Colors.grey : Colors.black,
                        ),
                      ),
                      subtitle: Text('${goal['hours']} hours'),
                      // CONNECTION: Delete icon removes goal from list
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => deleteGoal(index),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      // STATIC: Floating action button to add goals
      floatingActionButton: FloatingActionButton(
        // CONNECTION: Triggers adding a sample goal
        onPressed: addSampleGoal,
        child: const Icon(Icons.add),
      ),
    );
  }
}