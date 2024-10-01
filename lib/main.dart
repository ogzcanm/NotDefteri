import 'package:flutter/material.dart';
import 'package:not/models/note_database.dart';
import 'package:not/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'pages/notes_page.dart';

void main() async {
  // initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDataBase.initialize();

  runApp(
    MultiProvider(
      providers: [
        //Note Probiver
        ChangeNotifierProvider(create: (context) => NoteDataBase()),
        //Theme Provider
        ChangeNotifierProvider(create: (context) => ThemeProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const NotesPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
