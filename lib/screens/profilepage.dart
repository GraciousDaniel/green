import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  MyProfile({super.key});

  // Current logged-in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  // Future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance.collection('Users').doc(currentUser!.email).get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Add functionality to navigate to the edit profile page
            },
          ),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          // Loading...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          // Data received
          else if (snapshot.hasData) {
            // Extract data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile picture
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.grey[300],
                    child: const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Username
                  Text(
                    user!['username'],
                    style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  // Email
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      user['email'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Bio
                  Text(
                    user['bio'] ?? 'No bio available',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Additional details (you can customize this part based on your data model)
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: Text(user['location'] ?? 'Location not set'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(user['birthdate'] ?? 'Birthdate not set'),
                  ),
                  // Add more details as needed

                  const SizedBox(height: 20),

                  // Add more widgets or sections as needed

                  // Edit Profile Button
                  ElevatedButton(
                    onPressed: () {
                      // Add functionality to navigate to the edit profile page
                    },
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('No data'),
            );
          }
        },
      ),
    );
  }
}

//continue to build ui with help from gpt.