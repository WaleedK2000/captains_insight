import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NewTeam extends StatefulWidget {
  const NewTeam({Key? key, required this.data}) : super(key: key);

  final DatabaseReference data;

  @override
  State<NewTeam> createState() => _NewTeamState();
}

class _NewTeamState extends State<NewTeam> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                //_buildTeamButton(),
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
          }
        },
      );
}
