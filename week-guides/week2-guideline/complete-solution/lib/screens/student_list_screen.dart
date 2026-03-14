import 'package:flutter/material.dart';
import '../models/student.dart';
import '../data/student_data.dart';
import 'student_details_screen.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ValueListenableBuilder<List<Student>>(
        valueListenable: studentsNotifier,
        builder: (context, students, _) {
          if (students.isEmpty) {
            return const Center(child: Text('No students yet'));
          }
          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text('${student.id} · ${student.course}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailsScreen(student: student),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
