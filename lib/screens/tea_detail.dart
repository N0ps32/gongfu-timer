import 'package:flutter/material.dart';
import 'package:gongfu_timer/beans/tea.dart';
import 'package:intl/intl.dart';

class TeaDetail extends StatefulWidget {
  final Tea _tea;

  TeaDetail(this._tea);

  @override
  TeaDetailState createState() {
    return new TeaDetailState(this._tea);
  }
}

class TeaDetailState extends State<TeaDetail> {
  final Tea _tea;
  NumberFormat _format;

  TeaDetailState(this._tea) {
    this._format = new NumberFormat('##.##');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
        children: <Widget>[this._overviewCard],
      ),
    );
  }

  Widget _paddedCell(Widget child) {
    return TableCell(
        child: Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(50, 50, 50, .2)))),
      padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: child,
    ));
  }

  Widget get _overviewCard {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(_tea.name, style: TextStyle(fontSize: 28)),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text(_tea.nativeName,
                style: TextStyle(
                    fontSize: 16, color: Color.fromRGBO(50, 50, 50, .8))),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 30),
              child: Table(
                children: [
                  TableRow(children: [
                    _paddedCell(Text('Type')),
                    _paddedCell(Text('TBD'))
                  ]),
                  TableRow(children: [
                    _paddedCell(Text('Cultivar')),
                    _paddedCell(Text('TBD'))
                  ]),
                  TableRow(children: [
                    _paddedCell(Text('g per 100ml')),
                    _paddedCell(
                        Text('${_format.format(_tea.gramsPerMl * 100)}g')
                    )
                  ]),
                  TableRow(children: [
                    _paddedCell(Text('Brewing time')),
                    _paddedCell(Text('${_tea.brewingTimeS}s'))
                  ]),
                  TableRow(children: [
                    _paddedCell(Text('Time increase')),
                    _paddedCell(Text('${_tea.brewingTimeIncrease}s'))
                  ]),
                  TableRow(children: [
                    _paddedCell(Text('~ Infusions')),
                    _paddedCell(Text('${_tea.avgInfusions}'))
                  ]),
                ],
              ))
        ],
      ),
    );
  }
}
