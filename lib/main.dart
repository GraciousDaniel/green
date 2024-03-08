import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:green/components/authpage.dart';
import 'package:green/components/loginorregisterpage.dart';
import 'package:green/screens/homepage.dart';
import 'package:green/screens/profilepage.dart';
import 'package:green/screens/projecthubpage.dart';
import 'package:green/screens/resourcepage.dart';
import 'package:green/screens/splashscreen.dart';
import 'package:green/screens/userspage.dart';
import 'package:green/theme/darkmode.dart';
import 'package:green/theme/lightmode.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
      theme: lightMode,
      darkTheme: darkMode,
      routes: {
        '/authentication page':(context) => const AuthPage(),
        '/login orregister page':(context) => const LoginOrRegisterPage(),
        '/home page':(context) => Homepage(),
        '/profile page':(context) => MyProfile(),
        '/users page':(context) => const MyUsers(),
        '/my resources':(context) => const ResourcePage(),
        '/my projects':(context) => const ProjectPage(),
      },
    );
  }
}