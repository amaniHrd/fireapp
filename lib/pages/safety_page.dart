import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SafetyPage extends StatelessWidget {
  const SafetyPage({super.key});

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
                child: Icon(Icons.safety_check,
                    color: Color.fromARGB(255, 236, 160, 52), size: 45)),
            SizedBox(height: 20),
            Text(
              'Safety tips!',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 60),

            //safty tips

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //tip 1
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022',
                          style: TextStyle(fontSize: 12)), // Bullet symbol
                      SizedBox(width: 8),
                      Expanded(
                          child: Text(
                        'Stay informed: Stay updated on the local weather conditions, fire danger ratings, and any fire advisories or warnings issued by authorities.',
                      )),
                    ],
                  ),
                  SizedBox(height: 8), // Space between bullet points
                  //tip 2
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022',
                          style: TextStyle(fontSize: 12)), // Bullet symbol
                      SizedBox(width: 8), // Space between bullet and text
                      Expanded(
                        child: Text(
                            'Follow regulations: Respect and adhere to any fire restrictions or bans in place in your area.',
                            style: TextStyle()),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  //tip 3
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022',
                          style: TextStyle(fontSize: 12)), // Bullet symbol
                      SizedBox(width: 8), // Space between bullet and text
                      Expanded(
                        child: Text(
                            'Report fires: If you spot a fire, immediately report it to the appropriate authorities, such as emergency services or the local fire department.',
                            style: TextStyle()),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  //tip 4
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('\u2022',
                          style: TextStyle(fontSize: 12)), // Bullet symbol
                      SizedBox(width: 8), // Space between bullet and text
                      Expanded(
                        child: Text(
                            'Create defensible space: Clear away dry vegetation, leaves, and debris from around your home or property to create a buffer zone that can help prevent fire from spreading.',
                            style: TextStyle()),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
