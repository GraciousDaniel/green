import 'package:flutter/material.dart';
import 'package:green/screens/loginpage.dart';
import 'package:green/screens/signinpage.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  //initially show loginpage
  bool showLoginpage = true;

  //toggle between login and signin page
  void togglePages () {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return Loginpage(
        onTap: togglePages,
      );
    } else {
      return Signinpage(
        onTap: togglePages,
      );
    }
  }
}