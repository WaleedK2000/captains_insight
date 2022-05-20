import 'package:captains_insight/models/tournament.dart';
import 'package:captains_insight/services/database.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../models/Team.dart';

class NewTeam extends StatefulWidget {
  const NewTeam({Key? key, required this.tournament}) : super(key: key);

  final Tournament tournament;

  @override
  State<NewTeam> createState() => _NewTeamState(tournament);
}

class _NewTeamState extends State<NewTeam> {
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');

  final _formKey = GlobalKey<FormState>();

  final Tournament tournament;
  _NewTeamState(this.tournament);

  String _teamName = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _formKey,
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text('Add Team'),
          elevation: 0.0,
        ),
        body: Container(
          margin: EdgeInsets.all(24),
          child: Form(
            child: Column(
              children: <Widget>[
                _buildTeamName(),
                _buildTeamAddButton(),
                _buildDoneButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamName() => TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Team Name',
        hintText: 'Enter Team Name',
      ),
      validator: (Value) {
        if (Value!.isEmpty) {
          return 'Please enter a team name';
        } else if (Value.contains(nameRegExp)) {
          return 'Name can only contain alphabets';
        }
        return null;
      },
      onChanged: (value) {
        setState(() {
          _teamName = value;
        });
      });

  Widget _buildTeamAddButton() => ElevatedButton(
      child: const Text('Add Team'),
      onPressed: () {
        DatabaseReference dbRef = Database().saveTeam(Team(_teamName));

        tournament.addTeam(dbRef.key);
      });

  Widget _buildDoneButton() => ElevatedButton(
      child: const Text('Done'),
      onPressed: () {
        print('bigt');
        if (_formKey.currentState!.validate()) {
          Database().updateTournamentTeams(tournament);
        } else {
          print('OK?');
        }
        // Navigator.pop(context);
        // Navigator.pop(context);
      });
}
