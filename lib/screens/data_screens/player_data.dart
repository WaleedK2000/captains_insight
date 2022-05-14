import 'package:captains_insight/models/tournament.dart';
import 'package:captains_insight/services/database.dart';
import 'package:flutter/material.dart';

import '../../models/Team.dart';

class PlayerDataScreen extends StatelessWidget {
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

  Map<String, dynamic> t20i_det = {
    'matches': 74,
    'innings': 69,
    'notouts': 10,
    'runs': 2686,
    'highscore': 122,
    'ballsfaced': 2075,
    '100s': 1,
    '50s': 26,
    '4s': 278,
    '6s': 42,
    'catches': 34,
    'stumpings': 0,
  };

  Map<String, dynamic> odi_det = {
    'matches': 86,
    'innings': 84,
    'notouts': 12,
    'runs': 4261,
    'highscore': 158,
    'ballsfaced': 4719,
    '100s': 16,
    '50s': 18,
    '4s': 389,
    '6s': 42,
    'catches': 40,
    'stumpings': 0,
  };

  Map<String, dynamic> test_det = {
    'matches': 40,
    'innings': 71,
    'notouts': 9,
    'runs': 2851,
    'highscore': 196,
    'ballsfaced': 5301,
    '100s': 6,
    '50s': 21,
    '4s': 335,
    '6s': 14,
    'catches': 26,
    'stumpings': 0,
  };

  Map<String, dynamic> player_det = {
    'name': 'Babar Azam',
    'team': 'Pakistan',
    'role': 'Right Hand Bat',
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text('Player Data'),
          elevation: 0.0,
        ),
        body: SizedBox.expand(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                _buildTop(),
                const SizedBox(height: 25),
                // _buildTable(),
                _buildSomething(context),
                // _buildTeamAddButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPicture() => Image.asset(
        'assets/images/babar_azam.png',
        height: 200,
        width: 200,
        colorBlendMode: BlendMode.saturation,
      );

  Widget _buildTopHalf() => Container(
        child: Row(
          children: <Widget>[
            _buildPicture(),
            _buildPlayerName(),
          ],
        ),
      );

  Widget _buildCell(String text) => Container(
        padding: EdgeInsets.all(8),
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
            fontSize: 17,
            color: Colors.black,
          ),
        ),
      );

  Widget _buildTable(Map<String, dynamic> data) => Table(
        children: [
          rowSpacer,
          TableRow(
            children: [
              _buildCell('Matches'),
              _buildCell("Innings"),
              _buildCell("Runs"),
              _buildCell("Average"),
            ],
          ),
          TableRow(children: [
            _buildCell(data['matches'].toString()),
            _buildCell(data['innings'].toString()),
            _buildCell(data['runs'].toString()),
            _buildCell(
                (data['runs'] / data['innings'].toDouble()).toStringAsFixed(2)),
          ]),
          rowSpacer,
          TableRow(
            children: [
              _buildCell('HS'),
              _buildCell("BF"),
              _buildCell("100s"),
              _buildCell("50s"),
            ],
          ),
          TableRow(
            children: [
              _buildCell(data['highscore'].toString()),
              _buildCell(data['ballsfaced'].toString()),
              _buildCell(data['100s'].toString()),
              _buildCell(data['50s'].toString()),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              _buildCell('4s'),
              _buildCell("6s"),
              _buildCell("Ct"),
              _buildCell("S/R"),
            ],
          ),
          TableRow(
            children: [
              _buildCell(data['4s'].toString()),
              _buildCell(data['6s'].toString()),
              _buildCell(data['catches'].toString()),
              _buildCell((data['runs'] / data['ballsfaced'] * 100)
                  .toDouble()
                  .toStringAsFixed(2)),
            ],
          ),
        ],
      );

  Widget _buildTeamName() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Team Name',
          hintText: 'Enter Team Name',
        ),
      );

  Widget _buildTeamAddButton() => ElevatedButton(
      child: const Text('Add Team'), onPressed: () => print('pressed'));

  Widget _buildDoneButton() => ElevatedButton(
      child: const Text('Done'),
      onPressed: () {
        // Navigator.pop(context);
        // Navigator.pop(context);
      });

  _buildPlayerName() => Container(
        child: Text('Babar Azam'),
      );

  _buildTop() => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildPicture(),
              Column(
                children: const [
                  Text(
                    'Babar Azam',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Open sans',
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Right hand Bat',
                    style: TextStyle(fontFamily: 'Open sans', fontSize: 18),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Pakistan',
                    style: TextStyle(fontFamily: 'Open sans', fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ],
      );

  _buildSomething(BuildContext context) => Expanded(
        child: DefaultTabController(
          length: 3,
          initialIndex: 0,
          child: Column(
            children: [
              TabBar(
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                indicatorColor: Theme.of(context).primaryColor,
                tabs: const [
                  Tab(
                    text: 'T20I',
                  ),
                  Tab(
                    text: 'ODI',
                  ),
                  Tab(
                    text: 'Test',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildTable(t20i_det),
                    _buildTable(odi_det),
                    _buildTable(test_det),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
