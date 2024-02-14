import 'package:flutter/material.dart';
import 'dart:async';
import 'package:green/components/authpage.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage())); // Navigates to the AuthPage after a delay
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Replace 'assets/logo.png' with your actual logo asset path
            //text test
            const Text('green'),
            Image.asset('assets/logo.png', height: 100.0),
            const SizedBox(height: 20),
            const CircularProgressIndicator(), //Show a loading indicator
          ],
        ),
      ),
    );
  }
}
