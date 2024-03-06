import 'package:flutter/material.dart';
import 'package:green/screens/homepage.dart';
import 'package:green/screens/profilepage.dart';
import 'package:green/screens/projecthubpage.dart';
import 'package:green/screens/resourcepage.dart';
import 'package:green/screens/userspage.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Theme.of(context).colorScheme.background,
              child: Container(
                color: Colors.green,
                child: ListView(
                  children: [
                    const DrawerHeader(
                      child: Center(
                        child: Text('logo'),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: ListTile(
                        leading: const Icon(Icons.home),
                        title: const Text(
                          'Home',
                          style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Homepage()));
                          },
                      ),
                    ),

                    Padding(
                       padding: const EdgeInsets.only(left:10.0),
                       child: ListTile(
                        leading: const Icon(Icons.person),
                        title: const Text(
                          'Profile',
                          style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const MyProfile()));
                          },
                      ),
                     ),
                    
                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: ListTile(
                        leading: const Icon(Icons.people),
                        title: const Text(
                          'People',
                          style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const MyUsers()));
                          },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: ListTile(
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
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: ListTile(
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
                    ),

                    const SizedBox(width: 70),

                    Padding(
                      padding: const EdgeInsets.only(left:10.0),
                      child: ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text(
                          'Logout',
                          style: TextStyle(fontSize: 20),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const ResourcePage()));
                          },
                      ),
                    ),
                  ],
                ),
              ),
             );
  }
}