//Stores players id of players in the team
import 'package:firebase_database/firebase_database.dart';

class Team {
  late DatabaseReference _id;
  late int captain_id;
  String name = '';
  Set players = {};

  Team(this.name) {
    captain_id = 0;
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  void addPlayer(Player) {
    players.add(Player);
  }

  void removePlayer(Player) {
    players.remove(Player);
  }

  Map<String, dynamic> toJson() {
    return {'name': this.name};
  }
}
