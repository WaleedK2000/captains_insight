import 'package:flutter/material.dart';

class AverageBowlingLength extends StatefulWidget {
  const AverageBowlingLength({Key? key}) : super(key: key);

  @override
  State<AverageBowlingLength> createState() => _AverageBowlingLengthState();
}

class _AverageBowlingLengthState extends State<AverageBowlingLength> {
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
            _buildCell('Format'),
            _buildCell("PowerPlay"),
            _buildCell("Middle Overs"),
            _buildCell("Death Overs"),
          ],
        ),
        TableRow(children: [
          _buildCell('T20i'),
          _buildCell('N/A'),
          _buildCell('N/A'),
          _buildCell('N/A'),
        ]),
        TableRow(children: [
          _buildCell('ODI'),
          _buildCell('N/A'),
          _buildCell('N/A'),
          _buildCell('N/A'),
        ])
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
