import 'package:firebase_database/firebase_database.dart';

class Tournament {
  late DatabaseReference _id;
  String name = '';
  Set teams = {};

  //Stores team Ids of teams in the tournament

  Tournament(this.name);

  void setId(DatabaseReference id) {
    this._id = id;
  }

  void addTeam(Team) {
    teams.add(Team);
  }

  void removeTeam(Team) {
    teams.remove(Team);
  }

  Map<String, dynamic> toJson() {
    //return {'name': this.name, 'teams': this.teams};
    return {'name': name};
  }
}
