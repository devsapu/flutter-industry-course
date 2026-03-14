import 'package:flutter/foundation.dart';
import '../models/lecturer.dart';

final ValueNotifier<List<Lecturer>> lecturersNotifier = ValueNotifier<List<Lecturer>>([
  const Lecturer(name: 'Dr. Alice', id: 'L001', email: 'alice@example.com', department: 'CS'),
  const Lecturer(name: 'Dr. Bob', id: 'L002', email: 'bob@example.com', department: 'IT'),
]);

void addLecturer(Lecturer lecturer) {
  lecturersNotifier.value = [...lecturersNotifier.value, lecturer];
}
