import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
   MyProfile({super.key});

  //current logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;

  //future to fetch user details
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
    .collection('Users')
    .doc(currentUser!.email)
    .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',),
      ),
      //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          //loading...
          if(snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          //error
          else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          //data recieved
          else if (snapshot.hasData) {
            //extract data
            Map<String, dynamic>? user = snapshot.data!.data();

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                //profile pic
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(25),
                  child: const Icon(
                    Icons.person,
                    size: 64,
                  ),
                ),

                const SizedBox(height: 25),

                //username
                Text(user!['username'],
                style: const TextStyle(
                  fontSize: 24,
                   fontWeight: FontWeight.bold
                   ),
                ),

                //email
                Text(user['email'],
                style: TextStyle(
                  color: Colors.grey[600],
                ),
                ),
              ],
            );
          } 
          else {
            return const Text('No data');
          }
          
        },
      ),
    );
  }
}
//continue to build ui with help from gpt.