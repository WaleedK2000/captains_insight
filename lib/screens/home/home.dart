import 'package:flutter/material.dart';

import '../data_screens/player_list.dart';
import '../new_tournament/tournament_add.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.amber[400],
              title: const Text('Home Screen'),
              elevation: 0.0,
            ),
            body: Container(
                child: Form(
                    child: Column(
              children: <Widget>[
                _buildNewTournamentButton(context),
                _buildViewPlayers(context),
              ],
            )))));
  }

  Widget _buildNewTournamentButton(BuildContext context) => ElevatedButton(
        child: const Text('Add Tournament'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewTournament()),
          );
        },
      );

  Widget _buildViewPlayers(BuildContext context) => ElevatedButton(
        child: const Text('Player Stats'),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const PlayerListScreen()),
          );
        },
      );
}
