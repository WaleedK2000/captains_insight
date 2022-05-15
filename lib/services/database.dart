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

  void updateTournamentTeams(Tournament tournament) {
    DatabaseReference ref = tournament.getId();
    print('printing teams');

    print(tournament.toJson2(ref));
    print(tournament.getId());

    String path = 'tournaments/${tournament.getId().key}/teams';

    print(path);

    final _databaseReference = FirebaseDatabase.instance;
    var id = _databaseReference.reference().child(path).push();
    id.set(tournament.toJson3());
    print('printing teams');
    //return ref;
  }

  DatabaseReference saveTeam(Team team) {
    final _databaseReference = FirebaseDatabase.instance;
    var id = _databaseReference.reference().child('teams/').push();
    id.set(team.toJson());
    return id;
  }

  Future getPlayers() async {
    //DatabaseReference ref = tournament.getId();
    //print('printing teams');

    //print(tournament.toJson2(ref));
    //print(tournament.getId());

    String path = 'player_dat/';

    final _databaseReference = FirebaseDatabase.instance.ref();
    final snapshot = await _databaseReference.child(path).get();

    if (snapshot.exists) {
      return snapshot.value;
    }

    return "Error Occurred";
  }

  //Add tournament

}
