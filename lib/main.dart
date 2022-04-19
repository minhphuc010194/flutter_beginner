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
    return const MaterialApp(
      title: 'random text list',
      home: RandomWords(),
    );
  }
}
