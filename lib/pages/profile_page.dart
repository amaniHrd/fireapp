import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // Retrieve the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Check if the user is logged in
    if (user != null) {
      // Retrieve the email
      String email = user.email ?? '';
      print('User email: $email');
      textEditingController.text = email;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primary,
        iconTheme: IconThemeData(color: theme.colorScheme.onPrimary),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              //green box container
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(color: theme.colorScheme.primary),
              child: Icon(
                Icons.person,
                color: theme.colorScheme.onPrimary,
                size: 70,
              ),
            ),
            SizedBox(height: 0),
            TextField(
              controller: textEditingController,
              enabled: false,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                prefixIcon: Icon(Icons.email, color: theme.colorScheme.primary),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: theme.colorScheme.primary),
                ),
                fillColor: Colors.white10,
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
