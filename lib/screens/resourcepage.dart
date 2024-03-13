import 'package:flutter/material.dart';

class ResourcePage extends StatefulWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  State<ResourcePage> createState() => _ResourcePageState();
}

class _ResourcePageState extends State<ResourcePage> {
  List<String> resources = [
    'Article 1: Understanding Climate Change',
    'Article 2: Impact of Climate Change on Biodiversity',
    'Article 3: Solutions for Climate Change',
    'Video 1: The Science of Climate Change',
    'Video 2: Effects of Climate Change',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 175, 79),
        title: const Text('Resource Center'),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: InkWell(
                onTap: () {
                  // Handle tapping on resource
                  // You can navigate to a detail page or open the resource directly
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('You tapped on: ${resources[index]}'),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.article_outlined, color: Colors.blue),

                      const SizedBox(width: 16),
                      
                      Expanded(
                        child: Text(
                          resources[index],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

