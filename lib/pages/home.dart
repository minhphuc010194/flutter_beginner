import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final wordPair = 'hello everyone';
  @override
  Widget build(BuildContext context) {
    return Text(wordPair);
  }
}
