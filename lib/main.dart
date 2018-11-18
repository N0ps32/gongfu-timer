import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:gongfu_timer/screens/tea_detail.dart';

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
        body: RandomWords()
      ),
    );
  }

}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.join(' '),
        style: _biggerFont,
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TeaDetail())
        );
      }
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if(i.isOdd) {
          return Divider();
        }

        final idx = i ~/ 2;
        if(idx >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(1000));
        }

        return _buildRow(_suggestions[idx]);
      },
      padding: const EdgeInsets.all(16.0),
    );
  }
}
