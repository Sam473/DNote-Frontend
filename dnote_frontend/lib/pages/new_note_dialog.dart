import 'package:flutter/material.dart';

class NewNoteDialog extends StatefulWidget {
  const NewNoteDialog({Key? key}) : super(key: key);

  @override
  State<NewNoteDialog> createState() => _NewNoteDialogState();
}

class _NewNoteDialogState extends State<NewNoteDialog> {
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Add Note', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
      Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Title'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ])),
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: TextFormField(
          keyboardType: TextInputType.multiline,
          maxLines: 10,
          controller: bodyController,
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
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: submitForm, child: const Text("Submit")))
    ]);
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
