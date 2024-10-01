import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:not/companents/drawer.dart';
import 'package:not/companents/note_tile.dart';
import 'package:not/models/note.dart';
import 'package:not/models/note_database.dart';
import 'package:provider/provider.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller to access what the user typed
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //on app startup, fetch existing notes
    readNotes();
  }

  //create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        content: TextField(
          controller: textController,
        ),
        actions: [
          //create button
          MaterialButton(
            onPressed: () {
              //add to db
              context.read<NoteDataBase>().addNotes(textController.text);

              //clear controller
              textController.clear();

              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text("Oluştur"),
          )
        ],
      ),
    );
  }

  //read notes
  void readNotes() {
    context.read<NoteDataBase>().fetchNotes();
  }

  //update a note
  void updateNote(Note note) {
    //pre-fill the current note text
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Update Note"),
        content: TextField(controller: textController),
        actions: [
          //update button
          MaterialButton(
            onPressed: () {
              //update note in db
              context
                  .read<NoteDataBase>()
                  .updateNote(note.id, textController.text);
              //clear controller
              textController.clear();
              //pop dialog box
              Navigator.pop(context);
            },
            child: const Text("Güncelle"),
          )
        ],
      ),
    );
  }

  //delete a note
  void deleteNote(int id) {
    context.read<NoteDataBase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
    //note database
    final noteDatabase = context.watch<NoteDataBase>();

    // current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "Notlar",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          //LİST OF NOTES
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (context, index) {
                //get individual note
                final note = currentNotes[index];

                //list tile UI
                return NoteTile(
                  text: note.text,
                  onEditPressed: () => updateNote(note),
                  onDeletePressed: () => deleteNote(note.id),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
