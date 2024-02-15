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
            Image.asset(
              'lib/images/DALL·E 2024-02-15 14.49.53 - A simple and clear image of green leaves forming the shape of the Earth. The design should be straightforward and easy to understand, with the leaves .webp',
               height: 300.0,
               width: 200,
               ),
            //to show loading circle underneath it
            //const SizedBox(height: 20),
           // const CircularProgressIndicator(), //Show a loading indicator
          ],
        ),
      ),
    );
  }
}
