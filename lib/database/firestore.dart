import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // Current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  // Get collection of posts from Firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  // Post a message
  Future<void> addPost(String message) async {
    try {
      await posts.add({
        'PostMessage': message,
        'UserEmail': user?.email ?? 'Anonymous', // Handling null user case
        'Timestamp': Timestamp.now(), // Consistency in field name
      });
    } catch (e) {
      print('Error adding post: $e');
      throw e; // Propagate the error for further handling if necessary
    }
  }

  // Read posts from Firebase
  Stream<QuerySnapshot> getPostsStream() {
    try {
      final postsStream = FirebaseFirestore.instance
          .collection('Posts')
          .orderBy('Timestamp', descending: true) // Consistency in field name
          .snapshots();

      return postsStream;
    } catch (e) {
      print('Error fetching posts: $e');
      throw e; // Propagate the error for further handling if necessary
    }
  }
}
