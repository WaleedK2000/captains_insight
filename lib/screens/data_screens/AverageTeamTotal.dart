import 'package:flutter/material.dart';

class AverageTeamTotal extends StatelessWidget {
  const AverageTeamTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Average Bowling Length By Phase')),
        body: _buildTable());
  }

  static const rowSpacer = TableRow(children: [
    SizedBox(
      height: 15,
    ),
    SizedBox(
      height: 15,
    ),
  ]);

  _buildTable() => Table(children: [
        rowSpacer,
        TableRow(
          children: [
            _buildCell('Batting First'),
            _buildCell("Batting Second"),
          ],
        ),
        TableRow(children: [
          _buildCell('180'),
          _buildCell('175'),
        ]),
      ]);
  Widget _buildCell(String text) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(1),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
          ),
        ),
      );
}
