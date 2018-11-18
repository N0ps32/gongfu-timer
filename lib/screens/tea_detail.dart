import 'package:flutter/material.dart';

class TeaDetail extends StatefulWidget {

  @override
  TeaDetailState createState() {
    return new TeaDetailState();
  }

}

class TeaDetailState extends State<TeaDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Detail'),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
        children: <Widget>[
          this._overviewCard
        ],
      ),
    );
  }

  Widget get _overviewCard {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Table(
            children: [
              TableRow(
                children: [
                  TableCell(child: Text('Type')),
                  TableCell(child: Text('Lorem'))
                ]
              ),
              TableRow(
                  children: [
                    TableCell(child: Text('Water temp.')),
                    TableCell(child: Text('Lorem'))
                  ]
              ),
              TableRow(
                  children: [
                    TableCell(child: Text('g per 100ml')),
                    TableCell(child: Text('Lorem'))
                  ]
              )
            ],
          )
      ),
    );
  }

}
