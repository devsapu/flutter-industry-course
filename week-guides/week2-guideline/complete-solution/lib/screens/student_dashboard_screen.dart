import 'package:flutter/material.dart';
import '../models/student.dart';
import '../models/lecturer.dart';
import '../data/student_data.dart';
import '../data/lecturer_data.dart';
import 'add_student_screen.dart';
import 'student_list_screen.dart';
import 'add_lecturer_screen.dart';
import 'lecturer_list_screen.dart';

class StudentDashboardScreen extends StatelessWidget {
  const StudentDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student & Lecturer Management'),
      ),
      body: ValueListenableBuilder<List<Student>>(
        valueListenable: studentsNotifier,
        builder: (context, students, _) {
          return ValueListenableBuilder<List<Lecturer>>(
            valueListenable: lecturersNotifier,
            builder: (context, lecturers, _) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Students: ${students.length} · Lecturers: ${lecturers.length}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 24),
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
                      const SizedBox(height: 12),
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
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LecturerListScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.people),
                        label: const Text('Lecturer List'),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddLecturerScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_add),
                        label: const Text('Add Lecturer'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
