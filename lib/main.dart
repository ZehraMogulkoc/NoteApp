import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab6_project/screens/firstPage.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Note App',
    theme: ThemeData(
      primaryColor: Colors.indigo,
      scaffoldBackgroundColor: Colors.deepPurple,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.deepPurpleAccent,
      ),
    ),
    home: NotesPage(),
  );
}

