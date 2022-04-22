import 'dart:ffi';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    void _pushSaved() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) {
            final tiles = _saved.map(
              (pair) {
                return ListTile(
                  title: Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final divided = tiles.isNotEmpty
                ? ListTile.divideTiles(
                    context: context,
                    tiles: tiles,
                  ).toList()
                : <Widget>[];

            return Scaffold(
              appBar: AppBar(
                title: const Text('Saved Suggestions'),
              ),
              body: ListView(children: divided),
            );
          },
        ), // ...to here.
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
        actions: [
          IconButton(
              onPressed: _pushSaved,
              icon: const Icon(Icons.list),
              tooltip: 'Save Suggestions'),
        ],
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (context, i) {
            if (i.isOdd) return const Divider();
            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            final alreadySaved = _saved.contains(_suggestions[index]); // NEW

            // return ListTile(
            //   title: Text(
            //     index.toString() + '. ' + _suggestions[index].asPascalCase,
            //     style: _biggerFont,
            //   ),
            // );
            return ListTile(
              title: Text(
                _suggestions[index].asPascalCase,
                style: _biggerFont,
              ),
              trailing: Icon(
                // NEW from here ...
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ), // to here.
              onTap: () {
                // Widget okButton = TextButton(
                //   child: Text("OK"),
                //   onPressed: () {
                //     print('Ok');
                //   },
                // );
                // AlertDialog alert = AlertDialog(
                //   title: Text("My title"),
                //   content: Text("This is my message."),
                //   actions: [
                //     okButton,
                //   ],
                // );
                // // show the dialog
                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return alert;
                //   },
                // );
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[index]);
                  } else {
                    _saved.add(_suggestions[index]);
                  }
                });
              },
            );
          }),
    );
  }
}

//https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#5