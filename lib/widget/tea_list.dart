import 'package:flutter/material.dart';
import 'package:gongfu_timer/screens/tea_detail.dart';

class TeaList extends StatefulWidget {
  @override
  TeaListState createState() {
    return new TeaListState();
  }
}

class TeaListState extends State<TeaList> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildRow() {
    return ListTile(
        title: Text(
          '',
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

        return _buildRow();
      },
      padding: const EdgeInsets.all(16.0),
    );
  }
}
