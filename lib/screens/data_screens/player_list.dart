import 'package:captains_insight/screens/data_screens/player_data.dart';
import 'package:flutter/material.dart';

class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({Key? key}) : super(key: key);

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  late TextEditingController textController;

  var initDropdown = "Pakistan";

  var countriesList = [
    'Afghanistan',
    'Australia',
    'England',
    'Pakistan',
    'India'
  ];

  var players = {
    "Babar Azam": {
      "type": "Top Order Batter",
      "country": "Pakistan",
      "picture": "babar_azam"
    },
    "Mohammad Rizwan": {
      "type": "Wicketkeeper Batter",
      "country": "Pakistan",
      "picture": "mohammad_rizwan"
    },
    "Shan Masood": {
      "type": "Opening Batter",
      "country": "Pakistan",
      "picture": "shan_masood"
    },
    "Imam-ul-Haq": {
      "type": "Top Order Batter",
      "country": "Pakistan",
      "picture": "imam_ul_haq"
    },
  };

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  _buildPlayerCards() {
    var playersList = players.keys.toList();
    var columns = <Widget>[];
    for (var i = 0; i < (playersList.length); i += 2) {
      columns.add(
        Row(
          children: [
            _buildCard2(playersList[i], players[playersList[i]]),
            _buildCard2(playersList[i + 1], players[playersList[i]]),
          ],
        ),
      );
    }

    return columns;
  }

  _switchToPlayerDataScreen(BuildContext context, dat) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PlayerDataScreen(playerDat: dat)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      const SizedBox(height: 25),
      _buildSearchBar(),
      const SizedBox(height: 10),
      _buildCountrySortDropDown(),
      const SizedBox(height: 10),
      Container(
        child: Column(children: _buildPlayerCards()),
      )
    ]));
  }

  _buildSearchBar() => TextField(
        controller: textController,
        decoration: const InputDecoration(
          labelText: 'Player Name',
        ),
      );

  _buildCountrySortDropDown() => DropdownButton(
        items: countriesList.map((String val) {
          return DropdownMenuItem(
            value: val,
            child: Text(val),
          );
        }).toList(),
        value: initDropdown,
        onChanged: (String? newVal) {
          setState(() {
            initDropdown = newVal!;
          });
        },
      );

  _buildCard2(String player, playerDat) => Container(
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
              _buildPicture2(players[player]!['picture'].toString()),
              // _buildPlayerName(),
            ],
          ),
          Row(children: [
            Text(
              player,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
            )
          ]),
          Row(children: [
            Text(
              players[player]!['type'].toString(),
              textAlign: TextAlign.center,
            )
          ]),
          Row(children: [
            Text(
              players[player]!['country'].toString(),
              textAlign: TextAlign.center,
            )
          ])
        ]),
        onTap: () => _switchToPlayerDataScreen(context, playerDat),
      ));

  Widget _buildPicture2(String filename) => Container(
      child: Image.asset(
        'assets/images/' + filename + '.png',
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
