import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../components/mybutton.dart';
import '../components/mytextfield.dart';
import '../components/square_tile.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

// error message
  void warningAlert(String message) {
    QuickAlert.show(
      context: context,
      title: "Error!",
      text: message,
      type: QuickAlertType.warning,
      confirmBtnText: 'Ok',
      confirmBtnColor: Color.fromARGB(255, 20, 137, 116),
    );
  }

  void errorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20),
          title: Center(
              child: Text(
            message + ' Error',
            style: TextStyle(
                color: Colors.red[600],
                fontSize: 20,
                fontWeight: FontWeight.bold),
          )),
        );
      },
    );
  }

  //sign up method
  void signUserUp() async {
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
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        Navigator.pop(context); // to stop the progress bar
        warningAlert("passwords don't match! ");
        return; // to stop the rest of the code from executing
      }
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      //errorMessage(e.code);
      warningAlert(e.code);
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

                Image.asset(
                  'lib/images/icon.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 20),
                Text(
                  'Let\'s create an account for you!',
                  style: TextStyle(
                      fontSize: 15,
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
                //Confirm password
                SizedBox(height: 10),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  myObscureText: true,
                  prefixIcon: Icons.lock,
                ),
                //SignIn Button
                SizedBox(height: 25),
                MyButton(onTap: signUserUp, text: 'Sign Up'),
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
                        onTap: () => AuthService().signInWithGoogle()),
                  ],
                ),
                SizedBox(height: 30),
                //Register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now!',
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
