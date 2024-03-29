import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget {
  //final Icon myIcon;
  final Function()? onTap;
  final String text;
  const MyListTile(
      {super.key,
      //required this.myIcon,
      this.onTap,
      required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
     
      title: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.colorScheme.onPrimary,
          fontSize: 16,

        ),
      ),
      onTap: onTap,
    );
  }
}
