import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Never Ending Scrolling",
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {

  @override
  State createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = List<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 20.0);

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemBuilder: (BuildContext context, int i) {

        if(i.isOdd) {
          return Divider();
        }

        final index = i ~/ 2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Never-Ending Scroll"),
      ),
      body: _buildSuggestions(),
    );
  }
}