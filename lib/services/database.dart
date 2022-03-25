import 'package:captains_insight/models/tournament.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  final _databaseReference = FirebaseDatabase.instance;

  DatabaseReference saveTournament(Tournament tournament) {
    var id = _databaseReference.reference().child('tournaments/').push();
    id.set(tournament.toJson());
    return id;
  }

  //Add tournament

}
