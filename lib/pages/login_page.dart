import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../components/mybutton.dart';
import '../components/mytextfield.dart';
import '../components/square_tile.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;

// error message
  void errorMessage(String message) {
    QuickAlert.show(
      context: context,
      title: "Error!",
      text: message,
      type: QuickAlertType.warning,
      confirmBtnText: 'ok',
      confirmBtnColor: Color.fromARGB(255, 20, 137, 116),
    );
  }

  void signUserIn() async {
    //show loeading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorMessage(e.code);
    }

    //pop the loading circle
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                Container(
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'lib/images/icon.png',
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome back to SparkSpy !',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]),
                ),

                //username
                SizedBox(height: 25),

                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  myObscureText: false,
                  prefixIcon: Icons.person,
                ),
                //password
                SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  myObscureText: true,
                  prefixIcon: Icons.lock,
                ),

                //SignIn Button
                SizedBox(height: 25),
                MyButton(onTap: signUserIn, text: 'Sign In'),
                SizedBox(height: 40),
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
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 11),
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
                //sign in with google
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'lib/images/google.png',
                      onTap: () {
                        AuthService().signInWithGoogle();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                //Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Register now!',
                        style: TextStyle(
                          color: Colors.blue,
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
