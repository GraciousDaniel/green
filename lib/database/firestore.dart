/*

this database stores posts published by users in a collection
called posts in firebase. It contains a message, email and
timestamp of the user.

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  //current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  //get collection of posts from firebase
  final CollectionReference posts = FirebaseFirestore.instance.collection('Posts');

  //post a message
  Future<void> addPost(String message) {
    return posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  //read posts from firebase
  Stream<QuerySnapshot> getPostsStream() {
    final postsStream = FirebaseFirestore.instance
    .collection('Posts')
    .orderBy('Timestamp', descending: true)
    .snapshots();

    return postsStream;
  }
}
