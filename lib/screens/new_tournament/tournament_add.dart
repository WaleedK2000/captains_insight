import 'package:flutter/material.dart';

class NewTournament extends StatefulWidget {
  const NewTournament({Key? key}) : super(key: key);

  @override
  State<NewTournament> createState() => _NewTournamentState();
}

class _NewTournamentState extends State<NewTournament> {
  String __tournamentName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: const Text('Add Tournament'),
          elevation: 0.0,
        ),
        body:Container(margin: EdgeInsets.all(24),
        child:Form(child: Column(children: <Widget>[_buildtournamentName(),
        ],)))


    ); 
  }

  Widget _buildtournamentName() => TextFormField(
    decoration: const InputDecoration(
    border: OutlineInputBorder(),
    ),
    validator: (Value){
        if(Value!.isEmpty){
          return 'Please enter a tournament name';
        }
      },
      onChanged: (value){
        setState(() {
          __tournamentName = value;
        });
      },
    },
  );

}
