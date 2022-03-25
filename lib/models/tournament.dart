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

  DatabaseReference getId() {
    return this._id;
  }

  void addTeam(String? ref) {
    teams.add(ref);
  }

  void removeTeam(String ref) {
    teams.remove(ref);
  }

  Map<String, dynamic> toJson() {
    // if (teams.isEmpty) {
    return {'name': name};
    // } else {
    //   return {'name': name, 'teams': teams};
    //}
  }

  Map<String, dynamic> toJson2(DatabaseReference ref) {
    return {'name': name, 'teams': teams};
  }

  Map<String, dynamic> toJson3() {
    return {'teams': teams.toString()};
  }
}
