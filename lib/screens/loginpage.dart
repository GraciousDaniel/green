import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:green/components/imagessquaretile.dart';
import 'package:green/components/mybuttons.dart';
import 'package:green/components/mytextfields.dart';

class Loginpage extends StatefulWidget {
  final Function()? onTap;
   const Loginpage({super.key, required this.onTap});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {
    //show loading circle(thinking)
    //try signin
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text);
      //pop loading circle(thinking)
    } on FirebaseAuthException catch (e) {
      //wrong email
      if (e.code == 'user-not-found') {
        //show error to user
        wrongEmailMessage();
      }

      //wrong password
      else if (e.code == 'wrong-password') {
        //show error to user
        wrongPasswordMessage();
      }
    }

  }

  //wrong email message pop up
  void wrongEmailMessage () {
    showDialog(
      context: context, 
      builder: (context) {
      return const AlertDialog(
        title: Text('Incorrect email'),
        );
    },);
  }

  //wrong password message pop up
  void wrongPasswordMessage () {
    showDialog(
      context: context, 
      builder: (context) {
      return const AlertDialog(
        title: Text('Incorrect password'),
        );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                //logo
            
                const SizedBox(height: 50),
            
                //welcome text
                const Text(
                  'Welcome back user👋',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black),
                ),
            
                const SizedBox(height: 25),
            
                //email textfield
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                   
                //password textfield
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
            
                //forgot password
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.black),
                        
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 25),
            
                //login button
                MyButton(
                  text: 'Login',
                  onTap: signUserIn,
                ),
            
                const SizedBox(height: 50),
                //register option
                //continue with options
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
            
                //google button
               SquareTile(imagePath: 'lib/images/'),
            
                //apple button
                SquareTile(imagePath: 'lib/images/'),
            
                //okay register option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}