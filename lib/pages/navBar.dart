import 'package:fireapp/pages/profile.dart';
import 'package:fireapp/pages/profile_page.dart';
import 'package:fireapp/pages/safety_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../components/mylist_tile.dart';
import 'about_page.dart';
import 'emergency.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<void> signOutGoogle() async {
    // Sign out of Firebase.
    await auth.signOut();

    // Sign out of Google.
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.primary,
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 90),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'lib/images/icon.png',
              ),
            ),
            SizedBox(height: 20),
            MyListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profile()),
                  );
                },
                text: 'Profile'),
            MyListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmergencyPage()),
                  );
                },
                text: 'Emergency Services'),
            MyListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SafetyPage()),
                  );
                },
                text: 'Safety tips'),
            MyListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
                text: 'About'),
            MyListTile(
                onTap: () {
                  signOutGoogle();
                },
                text: 'Log out '),
          ],
        ),
      ),
    );
  }
}
