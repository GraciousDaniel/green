import 'package:flutter/material.dart';

class Article1 extends StatelessWidget {
  const Article1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 175, 79),
        title: const Text('Article 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Climate Change',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Climate change, fueled primarily by human activities like greenhouse gas emissions, poses significant threats including extreme weather events and rising sea levels. Combatting it requires global cooperation, transitioning to renewable energy, and advocating for policy changes. Understanding its causes and effects is crucial for shaping a sustainable future.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
