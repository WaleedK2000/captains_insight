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

  Future getTeams() async {
    String path = 'teams/';

    final _databaseReference = FirebaseDatabase.instance.ref();
    final snapshot = await _databaseReference.child(path).get();

    if (snapshot.exists) {
      return snapshot.value;
    }

    return "Error Occurred";
  }

  getHomeMenuItems() {
    return {
      'Player Stats': {'image': 'stat.png'},
      'Teams': {'image': 'team.png'},
      'Ground Stats': {'image': 'nsk.png'},
      'Tournaments': {'image': 'trophy.png'},
    };
  }


  List<String> getCountryList() {
    return ['Pakistan', 'Afghanistan', 'Australia', 'England', 'India'];

  }

  getPlayerData() {
    return {
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
  }


  getPlayerList() {
    return {
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
  }


  //Add tournament

}
