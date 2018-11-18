import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(GongfuTimer());

class GongfuTimer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gongfu Timer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gongfu Timer')
        ),
        body: Center(
          child: RandomWords()
        ),
      ),
    );
  }

}

class RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    return Text(wordPair.asPascalCase);
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() {
    return new RandomWordsState();
  }
}
