import 'package:flutter/material.dart';
import '../models/lecturer.dart';
import '../data/lecturer_data.dart';

class AddLecturerScreen extends StatefulWidget {
  const AddLecturerScreen({super.key});

  @override
  State<AddLecturerScreen> createState() => _AddLecturerScreenState();
}

class _AddLecturerScreenState extends State<AddLecturerScreen> {
  final _nameController = TextEditingController();
  final _idController = TextEditingController();
  final _emailController = TextEditingController();
  final _departmentController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _emailController.dispose();
    _departmentController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final id = _idController.text.trim();
    final email = _emailController.text.trim();
    final department = _departmentController.text.trim();
    if (name.isEmpty || id.isEmpty || email.isEmpty || department.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }
    addLecturer(Lecturer(name: name, id: id, email: email, department: department));
    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Lecturer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Lecturer Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: 'Lecturer ID'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _departmentController,
              decoration: const InputDecoration(labelText: 'Department'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submit,
              child: const Text('Add Lecturer'),
            ),
          ],
        ),
      ),
    );
  }
}
