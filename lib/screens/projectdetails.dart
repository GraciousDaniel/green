import 'package:flutter/material.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key});

  @override
  _ProjectDetailsPageState createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Project Title',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            const Text(
              'Description of the project goes here. Provide details about the goals, impact, and steps involved.',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 16),
            
            LinearProgressIndicator(
              value: isCompleted ? 1.0 : 0.5, // Set the progress value accordingly
              backgroundColor: Colors.grey,
              color: Colors.green,
            ),

            const SizedBox(height: 16),
            
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isCompleted = !isCompleted;
                });
                // Add any additional logic when the user marks the project as completed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isCompleted ? Colors.grey : Colors.green,
              ),
              child: Text(isCompleted ? 'Marked as Completed' : 'Mark as Completed'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context); // Navigate back to the previous page
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
