import 'package:captains_insight/models/tournament.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/Team.dart';

class Database {
  DatabaseReference saveTournament(Tournament tournament) {
    final _databaseReference = FirebaseDatabase.instance;
    var id = _databaseReference.reference().child('tournaments/').push();
    id.set(tournament.toJson());
    return id;
  }

  DatabaseReference saveTeam(Team team) {
    final _databaseReference = FirebaseDatabase.instance;
    var id = _databaseReference.reference().child('teams/').push();
    id.set(team.toJson());
    return id;
  }

  //Add tournament

}
