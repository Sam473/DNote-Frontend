import 'package:flutter/material.dart';

import '../components/notes_app_bar.dart';
import '../components/notes_navigation_bar.dart';

class NewNote extends StatefulWidget {
  const NewNote({Key? key}) : super(key: key);

  @override
  State<NewNote> createState() => _NewNoteState();
}

@Deprecated('use NewNoteDialog instead')
class _NewNoteState extends State<NewNote> {
  TextEditingController commentController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar('Notes', context),
      bottomNavigationBar: createNavBar('Notes', context),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Expanded(
          child: Form(
            key: _formKey,
            child:
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
              padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  controller: commentController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  controller: commentController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Body'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Flexible(
                  child: ElevatedButton(
                      onPressed: submitForm, child: const Text("Submit")))
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Submitting')),
      );
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }
  }
}
