import 'package:captains_insight/models/tournament.dart';
import 'package:flutter/material.dart';

import '../../services/database.dart';
import '../team/NewTeam.dart';

class NewTournament extends StatefulWidget {
  const NewTournament({Key? key}) : super(key: key);

  @override
  State<NewTournament> createState() => _NewTournamentState();
}

class _NewTournamentState extends State<NewTournament> {
  static final RegExp nameRegExp = RegExp('[a-zA-Z]');
  static final RegExp numberRegExp = RegExp(r'\d');
  final _formKey = GlobalKey<FormState>();

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
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buildtournamentName(),
                    const SizedBox(height: 25),
                    _buildTournamentNumber(),
                    const SizedBox(height: 25),
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
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a tournament name';
          } else if (value.contains(numberRegExp)) {
            return 'Name can only contain alphabets';
          }
          return null;
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

          if (value.contains(nameRegExp)) {
            return 'Enter a valid number of teams';
          }

          int valueInt = int.parse(value);
          if (valueInt > 25 || valueInt < 2) {
            return 'Enter a number between 2 and 25';
          }
          return null;
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
          if (_formKey.currentState!.validate()) {
            Tournament t = Tournament(__tournamentName);
            t.setId(Database().saveTournament(t));

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NewTeam(tournament: t)),
            );

            //Navigator.pop(context, __tournamentName);
          }
        },
      );
}
