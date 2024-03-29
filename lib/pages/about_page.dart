import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
            child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'lib/images/icon.png',
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'About US!',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                      textAlign: TextAlign.center,
                      'We are SparkSpy team we provide to you this application, in order to alert you in the case of fire in your surveilled zone. Providing you with details about the incident  such as the an image and a location, our goal is to make you interfere faster or to let you inform the responsible authorities as quickly as possible. Using SparkSpy you are 24/7 alerted and notified.',
                      style: TextStyle(
                        height: 1.8,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
