import 'package:flutter/material.dart';
import '../models/student.dart';

final List<Student> sampleStudents = [
  const Student(name: 'John Doe', id: 'S001', course: 'CS'),
  const Student(name: 'Jane Smith', id: 'S002', course: 'IT'),
];

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ListView.builder(
        itemCount: sampleStudents.length,
        itemBuilder: (context, index) {
          final student = sampleStudents[index];
          return ListTile(
            title: Text(student.name),
            subtitle: Text('${student.id} · ${student.course}'),
          );
        },
      ),
    );
  }
}
