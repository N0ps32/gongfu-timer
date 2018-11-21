import 'package:flutter/material.dart';
import 'package:gongfu_timer/beans/tea.dart';
import 'package:gongfu_timer/screens/tea_detail.dart';

class TeaList extends StatefulWidget {

  List<Tea> teas = [];
  TeaList({this.teas});

  @override
  TeaListState createState() {
    return new TeaListState(teas: this.teas);
  }
}

class TeaListState extends State<TeaList> {
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  List<Tea> teas = [];
  TeaListState({this.teas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemCount: teas.length,
      itemBuilder: (context, i) {
        final Tea tea = teas[i];
        return Container(
          child: ListTile(
              subtitle: Text(tea.nativeName),
              title: Text(
                tea.name,
                style: _biggerFont,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeaDetail(tea))
                );
              }
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color.fromRGBO(90, 90, 90, .2)
              )
            )
          ),
        );
      },
      padding: const EdgeInsets.all(16.0),
    );
  }
}
