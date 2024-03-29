import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quickalert/quickalert.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/fire_alert.dart';
import 'navBar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  //phone call
  makingPhoneCall() async {
    var url = Uri.parse("tel:14");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //alert message
  @override
  void initState() {
    super.initState();
    configureFirebaseMessaging();
  }

  void configureFirebaseMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        String title = message.notification?.title ?? '';
        String body = message.notification?.body ?? '';
        String image = message.notification!.android?.imageUrl ?? '';
        // Show an alert dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FireAlert(imageUrl: image, msg: body);
          },
        );
      }
    });
  } // configure firebase messaging

  Future<void> signOutGoogle() async {
    // Sign out of Firebase.
    await auth.signOut();

    // Sign out of Google.
    await googleSignIn.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: Container(
        margin: EdgeInsets.only(top: 80, bottom: 50),
        child: NavBar(),
      ),
      appBar: AppBar(
        backgroundColor: theme.colorScheme.onPrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              'lib/images/logo_color.png',
              fit: BoxFit.cover,
              height: 30,
            ),
            /* Text(
              'SparkSpy',
              style: GoogleFonts.lora(
                textStyle: TextStyle(
                  color: theme.colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),*/
          ],
        ),
        iconTheme: IconThemeData(color: theme.colorScheme.primary),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage('lib/images/forest_nogb.png'),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(1),
                BlendMode.dstATop,
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    decoration: BoxDecoration(),
                    width: 250,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          'No fire detected!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: theme.colorScheme.primary.withOpacity(0.8),
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text('Once detected an alert will be sent to you',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: theme.colorScheme.secondary,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
