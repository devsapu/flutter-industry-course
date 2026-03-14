import 'package:flutter/foundation.dart';
import '../models/student.dart';

final ValueNotifier<List<Student>> studentsNotifier = ValueNotifier<List<Student>>([
  const Student(name: 'John Doe', id: 'S001', email: 'john@example.com', course: 'CS'),
  const Student(name: 'Jane Smith', id: 'S002', email: 'jane@example.com', course: 'IT'),
]);

void addStudent(Student student) {
  studentsNotifier.value = [...studentsNotifier.value, student];
}
