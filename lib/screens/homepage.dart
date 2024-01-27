import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
   
  //show current user
  final user = FirebaseAuth.instance.currentUser!;

  //sign out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
             icon: const Icon(Icons.logout),
             )
             ],
             ),
      body: Center(child: Text('Hello user'),),
    );
  }
}