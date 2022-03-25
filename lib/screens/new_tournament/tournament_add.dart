import 'package:captains_insight/models/tournament.dart';
import 'package:flutter/material.dart';

import '../../services/database.dart';

class NewTournament extends StatefulWidget {
  const NewTournament({Key? key}) : super(key: key);

  @override
  State<NewTournament> createState() => _NewTournamentState();
}

class _NewTournamentState extends State<NewTournament> {
  String __tournamentName = '';
  int __tournamentSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text('Add Tournament'),
          elevation: 0.0,
        ),
        body: Container(
            margin: EdgeInsets.all(24),
            child: Form(
                child: Column(
              children: <Widget>[
                _buildtournamentName(),
                _buildTournamentNumber(),
                _buildTournamentButton(),
              ],
            ))));
  }

  Widget _buildtournamentName() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Tournament Name',
          hintText: 'Enter Tournament Name',
        ),
        validator: (Value) {
          if (Value!.isEmpty) {
            return 'Please enter a tournament name';
          }
        },
        onChanged: (value) {
          setState(() {
            __tournamentName = value;
          });
        },
      );

  Widget _buildTournamentNumber() => TextFormField(
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Total Teams',
          hintText: 'Enter Number of Teams',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a number';
          }
        },
        onChanged: (value) {
          setState(() {
            __tournamentSize = 33;
            // int.parse(value);
          });
        },
      );

  Widget _buildTournamentButton() => ElevatedButton(
        //Go to add team page

        child: const Text('Add Tournament'),
        onPressed: () {
          if (__tournamentName.isEmpty) {
            return;
          }
          Tournament t = Tournament(__tournamentName);
          t.setId(Database().saveTournament(t));

          Navigator.pop(context, __tournamentName);
        },
      );
}
