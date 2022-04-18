import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar createAppBar(String title, BuildContext context) {
  return AppBar(
    title: Text(title),
    backgroundColor: Colors.purple,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        icon: const FaIcon(FontAwesomeIcons.wrench),
        tooltip: 'Settings',
        onPressed: () {
          Navigator.pushNamed(context, '/settings');
        },
      ),
    ],
  );
}
