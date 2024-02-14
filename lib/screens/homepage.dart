import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/screens/projecthubpage.dart';
import 'package:green/screens/resourcepage.dart';

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
        backgroundColor: const Color.fromARGB(255, 76, 175, 79),
        actions: [
          IconButton(
            onPressed: signUserOut,
             icon: const Icon(Icons.logout),
             )
             ],
             ),
             drawer: Drawer(
              child: Container(
                color: Colors.green,
                child: ListView(
                  children: [
                    const DrawerHeader(
                      child: Center(
                        child: Text('logo'),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.water_drop),
                      title: const Text(
                        'Project Hub',
                        style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ProjectPage()));
                        },
                    ),
                    ListTile(
                      leading: const Icon(Icons.psychology),
                      title: const Text(
                        'Resource Center',
                        style: TextStyle(fontSize: 20),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const ResourcePage()));
                        },
                    ),
                  ],
                ),
              ),
             ),
    );
  }
}