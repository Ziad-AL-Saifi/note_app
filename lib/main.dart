import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/constante.dart';
import 'package:note/views/home_page.dart';
import 'constante.dart';
import 'model/note_models.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNewBox);
  Hive.registerAdapter(NoteModelAdapter());
  runApp(NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: HomePage(),
    );
  }
}
