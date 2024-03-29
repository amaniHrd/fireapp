import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email = '';

  @override
  void initState() {
    super.initState();
    retrieveUserEmail();
  }

  Future<void> retrieveUserEmail() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        email = user.email ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onPrimary,
        iconTheme: IconThemeData(color: theme.colorScheme.primary),
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(children: [
            SizedBox(height: 50),
            Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.person,
                    color: Color.fromARGB(255, 236, 160, 52), size: 45)),
            SizedBox(height: 20),
            Text(
              'Profile',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),
            Divider(
              color: theme.colorScheme.primary,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, color: theme.colorScheme.primary),
                SizedBox(
                  width: 20,
                ),
                Text(email, style: TextStyle(color: Colors.black)),
              ],
            ),
            Divider(
              color: theme.colorScheme.primary,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            )
          ]),
        ),
      ),
    );
  }
}
