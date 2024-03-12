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
        title: const Text('Resource Center'),
      ),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(resources[index]),
            onTap: () {
              // Handle tapping on resource
              // You can navigate to a detail page or open the resource directly
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('You tapped on: ${resources[index]}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
