import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gongfu_timer/beans/tea.dart';
import 'package:gongfu_timer/data/tea_api.dart';
import 'package:gongfu_timer/widget/tea_list.dart';

void main() => runApp(GongfuTimer());

class GongfuTimer extends StatefulWidget {

  @override
  GongfuTimerState createState() {
    return new GongfuTimerState();
  }

}

class GongfuTimerState extends State<GongfuTimer> {

  bool _loaded = false;
  bool _error = false;
  List<Tea> teas;
  final TeaApi teaApi = new TeaApi();

  GongfuTimerState() {
    teaApi.fetchTeas().then((teas) {
      this.setState(() {
        this.teas = teas;
        this._loaded = true;
        this._error = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gongfu Timer',
      home: Scaffold(
          appBar: AppBar(
              title: Text('Gongfu Timer')
          ),
          body: _loaded ? Container(
            child: TeaList(teas: teas)
          ) : this._loadingWidget()
      ),
    );
  }

  Widget _loadingWidget() {
    return _error ? Container(
      child: MaterialButton(onPressed: () {
        setState(() {
          _error = false;
        });
      }, child: Text('Tap to retry')),
    ) : Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: CircularProgressIndicator(),
          ),
          new Text("Brewing...", style: TextStyle(fontSize: 25)),
        ],
      ),
    );
  }

}
