import 'package:english_words/english_words.dart';
import 'package:fireapp/pages/auth_page.dart';
import 'package:fireapp/pages/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//subscribe to  all users
void subscribeToAllUsersTopic() async {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.subscribeToTopic('all_users');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'fireapp',
    //options: DefaultFirebaseOptions.currentPlatform,
    options: FirebaseOptions(
      apiKey: 'AIzaSyBRf3U_wFzd8teXRL1GKwjysxYU2Jycx28',
      appId: '1:811018333400:android:e8146760e57c19536d7bad',
      messagingSenderId: '811018333400',
      projectId: 'firedetection-3880a',
      storageBucket:
          'firedetection-3880a.appspot.com', // Specify your storage bucket name here
    ),
  );
  subscribeToAllUsersTopic();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Color myColor = Color(int.parse('#b9f5ab', radix: 16));
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'fireapp',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              //seedColor: Color.fromARGB(122, 17, 29, 14)),
              seedColor: Color.fromARGB(255, 1, 61, 45)),
          //seedColor: Color.fromARGB(12, 141, 156, 99)),
        ),
        //home: AuthPage(),
        home: Splash(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}
