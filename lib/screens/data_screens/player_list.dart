import 'package:flutter/material.dart';

class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({Key? key}) : super(key: key);

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  late TextEditingController textController;

  var init_dropdown = "Pakistan";

  var countries_list = [
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
    var players_list = players.keys.toList();
    var columns = <Widget>[];
    for (var i = 0; i < (players_list.length); i += 2) {
      columns.add(
        Row(
          children: [
            _buildCard2(players_list[i]),
            _buildCard2(players_list[i + 1]),
          ],
        ),
      );
    }

    return columns;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Players'),
            ),
            body: Column(children: [
              const SizedBox(height: 10),
              _buildSearchBar(),
              const SizedBox(height: 10),
              _buildCountrySortDropDown(),
              const SizedBox(height: 10),
              Container(
                child: Column(children: _buildPlayerCards()),
              )
            ])));
  }

  _buildSearchBar() => TextField(
        controller: textController,
        decoration: const InputDecoration(
          labelText: 'Player Name',
        ),
      );

  _buildCountrySortDropDown() => DropdownButton(
        items: countries_list.map((String val) {
          return DropdownMenuItem(
            value: val,
            child: Text(val),
          );
        }).toList(),
        value: init_dropdown,
        onChanged: (String? newVal) {
          setState(() {
            init_dropdown = newVal!;
          });
        },
      );

  _buildCard2(String player) => Container(
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
      );

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
