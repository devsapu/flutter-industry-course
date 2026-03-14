import 'package:flutter/material.dart';
import '../models/lecturer.dart';
import '../data/lecturer_data.dart';
import 'lecturer_details_screen.dart';

class LecturerListScreen extends StatelessWidget {
  const LecturerListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lecturers'),
      ),
      body: ValueListenableBuilder<List<Lecturer>>(
        valueListenable: lecturersNotifier,
        builder: (context, lecturers, _) {
          if (lecturers.isEmpty) {
            return const Center(child: Text('No lecturers yet'));
          }
          return ListView.builder(
            itemCount: lecturers.length,
            itemBuilder: (context, index) {
              final lecturer = lecturers[index];
              return ListTile(
                title: Text(lecturer.name),
                subtitle: Text('${lecturer.id} · ${lecturer.department}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LecturerDetailsScreen(lecturer: lecturer),
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
