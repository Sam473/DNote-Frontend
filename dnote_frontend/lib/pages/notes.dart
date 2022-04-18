import 'package:flutter/material.dart';

import '../components/notes_app_bar.dart';
import '../components/notes_navigation_bar.dart';

class Note extends StatefulWidget {
  const Note({Key? key}) : super(key: key);

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Notes', context),
      bottomNavigationBar: createNavBar('Notes', context),
      body: ListView.builder(
          itemCount: 4, // the length
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    ListTile(
                      title: Text('Note Title', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                      subtitle: Text('Sample note text, this is a sample note text text...', style: TextStyle(fontSize: 16)),
                      trailing: Icon(Icons.edit),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
