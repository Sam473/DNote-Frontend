import 'package:dnote_frontend/pages/about.dart';
import 'package:dnote_frontend/pages/new_note.dart';
import 'package:flutter/material.dart';

import 'pages/notes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'DNote';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: _title,
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const Notes(),
          '/about': (context) => const AboutPage(),
          '/new_note': (context) => const NewNote(),
          '/search': (context) => const Notes(),
          '/settings': (context) => const Notes(),
        });
  }
}
