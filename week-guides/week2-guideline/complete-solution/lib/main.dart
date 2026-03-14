import 'package:flutter/material.dart';
import 'screens/student_dashboard_screen.dart';
import 'screens/student_list_screen.dart';
import 'screens/add_student_screen.dart';

void main() {
  runApp(const StudentManagementApp());
}

/// Orchestration: routes and navigation for the Student Management App.
class StudentManagementApp extends StatelessWidget {
  const StudentManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Management System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StudentDashboardScreen(),
        '/students': (context) => const StudentListScreen(),
        '/add': (context) => const AddStudentScreen(),
      },
    );
  }
}
