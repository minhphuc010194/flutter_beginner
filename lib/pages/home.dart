import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return Text(wordPair.asPascalCase);
  }
}
