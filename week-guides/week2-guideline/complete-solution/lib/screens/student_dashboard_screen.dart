import 'package:flutter/material.dart';
import 'add_student_screen.dart';
import 'student_list_screen.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management System'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddStudentScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Add Student'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StudentListScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.list),
              label: const Text('Student List'),
            ),
          ],
        ),
      ),
    );
  }
}
