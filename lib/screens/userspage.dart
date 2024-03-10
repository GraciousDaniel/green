import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyUsers extends StatefulWidget {
  const MyUsers({super.key});

  @override
  State<MyUsers> createState() => _MyUsersState();
}

class _MyUsersState extends State<MyUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          //any errors
          if (snapshot.hasError) {
            return const Text('Something went wrong');
            //include error context
          }

          //show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == null) {
            return const Text('No data');
          }

          //get all users
          final users = snapshot.data!.docs;

          return Column(
            children: [
              //list of app users
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    //get individual user
                    final user = users[index];
                
                    return  ListTile(
                      title: Text(user['username']),
                      subtitle: Text(user['email']),
                    );
                  },
                  ),
              ),
            ],
          );
        }
      ),
    );
  }
}