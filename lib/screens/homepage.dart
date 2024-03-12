import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/components/buttons/postbutton.dart';
import 'package:green/components/mydrawer.dart';
import 'package:green/components/mytextfields.dart';
import 'package:green/database/firestore.dart';

class Homepage extends StatelessWidget {
   Homepage({super.key});
   //firestore access
   final FirestoreDatabase database = FirestoreDatabase();

   //text controller
   final TextEditingController newPostController = TextEditingController();

   //post message
   void postMessage() {
    //only post a message if there is sth in the textfield
    if (newPostController.text.isNotEmpty) {
      String message = newPostController.text;
      database.addPost(message);
    }
    //clear the controller
    newPostController.clear();
   }
   
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
        body: Column(
          children: [
            //textfield for user to type
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Row(
                children: [
                  Expanded(
                    child: MyTextfield(
                      controller: newPostController,
                       hintText: 'Say something...',
                        obscureText: false),
                  ),

                  //post button
                  MyPostButton(
                    onTap: postMessage,
                  )
                ],
              ),
            ),

            //user posts
            StreamBuilder(
              stream: database.getPostsStream(),
               builder: (context, snapshot) {
                //show loading circle
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                //get all posts
                final posts = snapshot.data!.docs;

                //no data?
                if (snapshot.data == null || posts.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(25),
                      child: Text('Post something today..'),
                      ),
                  );
                }

                //return as a list
                return Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      //get each individual post
                      final post = posts[index];
                  
                      //get data from each post
                      String message = post['PostMessage'];
                      String userEmail = post['UserEmail'];
                      Timestamp timestamp = post['Timestamp'];
                  
                      //return as list tile
                      return Padding(
                        padding: const EdgeInsets.only(left:25, right: 25),
                        child: ListTile(
                          title: Text(message),
                          subtitle: Text(userEmail),
                        ),
                      );
                  
                    }
                    ),
                );
               }
               )
          ],
        ),
    );
  }
}