import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:green/screens/projectdetails.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<PieChartSectionData> pieChartData = [
    PieChartSectionData(
      color: Colors.green,
      title: 'Renewable Energy',
      value: 30,
    ),
    PieChartSectionData(
      color: Colors.blue,
      title: 'Tree Planting',
      value: 20,
    ),
    PieChartSectionData(
      color: Colors.orange,
      title: 'Waste Reduction',
      value: 25,
    ),
    PieChartSectionData(
      color: Colors.red,
      title: 'Transportation',
      value: 15,
    ),
    PieChartSectionData(
      color: Colors.purple,
      title: 'Other',
      value: 10,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 175, 79),
        title: const Text('Project Hub'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Climate Action Projects',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            const Text(
              'Your Progress:',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 8),

            // Animated Pie Chart
            Container(
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Title of pie chart
                  const Text('PROJECTS'),

                  // Pie chart
                  PieChart(
                    swapAnimationDuration: const Duration(milliseconds: 750),
                    swapAnimationCurve: Curves.easeInOutQuint,
                    // Pie chart data
                    PieChartData(
                      sections: pieChartData,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Explore Projects button
            ElevatedButton(
              onPressed: () {
                // Add your logic to navigate to the specific project details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjectDetailsPage(),
                  ),
                );
              },
              child: const Text(
                'Explore Projects',
                style: TextStyle(color: Colors.black),
              ),
            ),

            const SizedBox(height: 16),

            // Project names and percentages in cards
            Column(
              children: pieChartData.map((data) {
                double percentage = (data.value / 100) * 100; // Calculate percentage
                return _buildProjectCard(context, data.title, data.color, percentage);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build project card
  Widget _buildProjectCard(BuildContext context, String projectName, Color color, double percentage) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProjectDetailsPage when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProjectDetailsPage(),
          ),
        );
      },
      child: Card(
        color: color,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 50, // Fixed height for all cards
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  projectName,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  '$percentage%',
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}