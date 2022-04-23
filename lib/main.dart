import 'package:flutter/material.dart';
import 'package:flutter_beginner/pages/home.dart';
import 'package:flutter_beginner/pages/randomWords.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      title: 'random text list',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Color.fromARGB(159, 170, 9, 47)),
      ),
      home: const RandomWords(),
    );
  }
}
