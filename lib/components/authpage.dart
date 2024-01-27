import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/components/loginorregisterpage.dart';
import 'package:green/screens/homepage.dart';
import 'package:green/screens/loginpage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
       stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context, snapshot) {
        //is the user logged in
        if (snapshot.hasData) {
          return Homepage();
        }

        //is the user not logged in
        else {
          return LoginOrRegisterPage();
        }

       }, 
      ),
    );
  }
}