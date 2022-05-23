import 'package:captains_insight/interfaces/home_Interface.dart';
import 'package:captains_insight/screens/data_screens/player_list.dart';
import 'package:captains_insight/screens/new_tournament/tournament_add.dart';
import 'package:captains_insight/screens/team/TeamsListScreen.dart';
import 'package:captains_insight/services/database.dart';
import 'package:flutter/material.dart';

class Controller implements home_interface {
  static final Controller _controller = Controller._internal();
  final Database db = Database();

  factory Controller() {
    return _controller;
  }

  Controller._internal();

  //BuildContext get context => BuildContext();

  @override
  Map<String, dynamic> getMenuItems() {
    return db.getHomeMenuItems();
  }

  @override
  menuItemSelected(item, BuildContext context) {
    // TODO: implement menuItemSelected

    if (item == 'Player Stats') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const PlayerListScreen()),
      );
    } else if (item == 'Teams') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TeamsListScreen()),
      );
    } else if (item == 'Tournaments') {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const NewTournament()),
      );
    } else {
      throw UnimplementedError;
    }
  }
}
