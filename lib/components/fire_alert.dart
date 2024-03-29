import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FireAlert extends StatelessWidget {
  final String imageUrl;
  final String msg;
  const FireAlert({super.key, required this.imageUrl, required this.msg});

  // call emergency services
  makingPhoneCall() async {
    var url = Uri.parse("tel:14");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      backgroundColor: Colors.white,
      // title:
      title: Center(
        child: Text(
          'Fire Detected!',
          style: TextStyle(
            color: Color.fromARGB(255, 236, 160, 52),

          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: 220,
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          SizedBox(height: 16),
          Text(
            msg,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: theme.colorScheme.primary,
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text(
                'Dismiss',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            TextButton(
              style: ButtonStyle(
                  // padding:
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 236, 160, 52))),
              onPressed: () async {
                await makingPhoneCall();
                Navigator.pop(context);
              },
              child: Text(
                'Call Fire fighters',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
