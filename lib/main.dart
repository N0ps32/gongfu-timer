import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(GongfuTimer());

class GongfuTimer extends StatefulWidget {

  @override
  GongfuTimerState createState() {
    return new GongfuTimerState();
  }

}

class GongfuTimerState extends State<GongfuTimer> {

  bool _loaded = false;
  bool _error = true;

  @override
  Widget build(BuildContext context) {

    new Timer(Duration(seconds: 5), () {
        setState(() {
          //_loaded = true;
        });
    });

    return MaterialApp(
      title: 'Gongfu Timer',
      home: Scaffold(
          appBar: AppBar(
              title: Text('Gongfu Timer')
          ),
          body: _loaded ? Container(
            child: Text('loaded'),
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
