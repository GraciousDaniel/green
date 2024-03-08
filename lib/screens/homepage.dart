import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/components/mydrawer.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
   
  //show current user
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //this is for the theme
      //backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 76, 175, 79),
        title: const Text('Home',),
        ),
        drawer: const MyDrawer(),
    );
  }
}