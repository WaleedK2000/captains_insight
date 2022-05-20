import 'package:captains_insight/screens/data_screens/TeamPlayerList.dart';
import 'package:flutter/material.dart';

class TeamsListScreen extends StatefulWidget {
  const TeamsListScreen({Key? key}) : super(key: key);

  @override
  State<TeamsListScreen> createState() => _TeamsListScreenState();
}

class _TeamsListScreenState extends State<TeamsListScreen> {
  final teams = {
    "Multan Sultan": {"image": 'psl_ms.png'},
    "Peshawar Zalmi": {"image": 'psl_pz.png'}
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Teams')),
        body: Column(children: [
          const SizedBox(height: 25),
          const SizedBox(height: 10),
          Column(children: _buildTeamCards())
        ]));
  }

  _buildTeamCards() {
    var teamsList = teams.keys.toList();
    var columns = <Widget>[];
    for (var i = 0; i < (teamsList.length); i += 2) {
      columns.add(Row(children: [
        _buildCard2(teamsList[i], teams[teamsList[i]]),
        _buildCard2(teamsList[i + 1], teams[teamsList[i]]),
      ]));
    }

    return columns;
  }

  _buildCard2(String team, teamDat) => Container(
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 3,
          style: BorderStyle.solid,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color.fromARGB(199, 255, 255, 255),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: const BorderRadius.all(Radius.circular(22)),
      ),
      child: InkWell(
          child: Column(children: [
            Row(
              children: [
                _buildPicture2(teams[team]!['image'].toString()),
                // _buildPlayerName(),
              ],
            ),
            Row(children: [
              Text(
                team,
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
              )
            ])
          ]),
          onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => TeamPlayerList(team: teamDat)),
                )
              } //_switchToPlayerDataScreen(context, playerDat),
          ));

  Widget _buildPicture2(String filename) => Container(
      child: Image.asset(
        'assets/images/' + filename,
        height: 150,
        width: 150,
        colorBlendMode: BlendMode.saturation,
      ),
      padding: const EdgeInsetsDirectional.fromSTEB(2, 10, 5, 10),
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 0),
        borderRadius: const BorderRadius.all(Radius.circular(22)),
      ));
}
