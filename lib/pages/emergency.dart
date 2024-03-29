import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyPage extends StatefulWidget {
  const EmergencyPage({super.key});

  @override
  State<EmergencyPage> createState() => _EmergencyPageState();
}

class _EmergencyPageState extends State<EmergencyPage> {
  makingPhoneCall(number) async {
    var url = Uri.parse("tel:$number");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
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
                    child: Icon(Icons.phone,
                        color: Color.fromARGB(255, 236, 160, 52), size: 45)),
                SizedBox(height: 20),
                Text(
                  'Emergency Contacts!',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 60),
                //
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    children: [
                      //fire fighters
                      Row(
                        children: [
                          SizedBox(width: 30),
                          GestureDetector(
                            onTap: () async {
                              await makingPhoneCall(14);
                            },
                            child: Icon(Icons.phone,
                                color: Color.fromARGB(255, 236, 160, 52)),
                          ),
                          SizedBox(width: 40),
                          Text(
                            'Fire Fighters                         14',
                            style: TextStyle(
                                fontSize: 16,
                                color: theme.colorScheme.secondary),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //hotline
                      Row(
                        children: [
                          SizedBox(width: 30),
                          GestureDetector(
                            onTap: () async {
                              await makingPhoneCall(1070);
                            },
                            child: Icon(Icons.phone,
                                color: Color.fromARGB(255, 236, 160, 52)),
                          ),
                          SizedBox(width: 40),
                          Text(
                            'Fire reporting Hotline      1070',
                            style: TextStyle(
                                fontSize: 16,
                                color: theme.colorScheme.secondary),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      //medical assistance

                      Row(
                        children: [
                          SizedBox(width: 30),
                          GestureDetector(
                            onTap: () async {
                              await makingPhoneCall(115);
                            },
                            child: Icon(Icons.phone,
                                color: Color.fromARGB(255, 236, 160, 52)),
                          ),
                          SizedBox(width: 40),
                          Text(
                            'Medical assistance           115',
                            style: TextStyle(
                                fontSize: 16,
                                color: theme.colorScheme.secondary),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
