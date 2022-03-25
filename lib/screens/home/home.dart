import 'package:flutter/material.dart';

import '../new_tournament/tournament_add.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              title: const Text('Add Tournament'),
              elevation: 0.0,
            ),
            body: Container(
                child: Form(
                    child: Column(
              children: <Widget>[
                _buildNewTornamentButton(context),
              ],
            )))));
  }

  Widget _buildNewTornamentButton(BuildContext context) => ElevatedButton(
        child: const Text('Add Tournament'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewTournament()),
          );
        },
      );
}
