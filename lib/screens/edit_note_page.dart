import 'package:flutter/material.dart';
import 'package:lab6_project/dlb/notes_database.dart';
import 'package:lab6_project/model/note_model.dart';
import 'package:lab6_project/widget/note_form_widget.dart';

class AddEditNotePage extends StatefulWidget {
  final Note? myNote;

  const AddEditNotePage({
    Key? key,
    this.myNote,
  }) : super(key: key);
  @override
  _AddEditNotePageState createState() => _AddEditNotePageState();
}

class _AddEditNotePageState extends State<AddEditNotePage> {
  final _formKey = GlobalKey<FormState>();
  late bool isImportant;
  late int number;
  late String title;
  late String noteContent;

  @override
  void initState() {
    super.initState();

    isImportant = widget.myNote?.isImportant ?? false;
    number = widget.myNote?.number ?? 0;
    title = widget.myNote?.title ?? '';
    noteContent = widget.myNote?.description ?? '';
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(

    ),
    body: Form(

      key: _formKey,
      child: Column(
        children: [
          NoteFormWidget(
          isImportant: isImportant,
          number: number,
          title: title,
          description: noteContent,
          onChangedImportant: (isImportant) =>
              setState(() => this.isImportant = isImportant),
          onChangedNumber: (number) => setState(() => this.number = number),
          onChangedTitle: (title) => setState(() => this.title = title),
          onChangedDescription: (description) =>
              setState(() => this.noteContent = description),
        ),
          buildButton()],
      ),
    ),
  );

  Widget buildButton() {
    final isFormValid = title.isNotEmpty && noteContent.isNotEmpty;

    return Padding(
      padding: EdgeInsets.only(left: 200,top: 200),
      child: FloatingActionButton(

        onPressed: addOrUpdateNote,
        child: Text('Save it!'),
      ),
    );
  }

  void addOrUpdateNote() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
        await addNote();
      Navigator.of(context).pop();
    }
  }



  Future addNote() async {
    final note = Note(
      title: title,
      isImportant: true,
      number: number,
      description: noteContent,
      createdTime: DateTime.now(),
    );

    await NotesDatabase.instance.create(note);
  }
}