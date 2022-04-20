import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

import '../../models/tournament.dart';
import '../new_tournament/tournament_add.dart';

class ViewTournaments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var th = await val(context);

    return FutureBuilder<Map<String, dynamic>>(
        future: val(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("There Was Error");
          } else if (snapshot.hasData) {
            Map<String, dynamic> th = {};
            snapshot.data?.forEach((key, value) {
              th[key] = value;
            });

            return Container(
                child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.brown[400],
                      title: const Text('Tournaments'),
                      elevation: 0.0,
                    ),
                    body: Container(
                        child: Form(
                            child: Column(
                      children: <Widget>[
                        _buildSelectTournament(context, th),
                      ],
                    )))));
          } else {
            return Text("There Was Error");
          }
        });
    /*
    return Container(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              title: const Text('Tournaments'),
              elevation: 0.0,
            ),
            body: Container(
                child: Form(
                    child: Column(
              children: <Widget>[
                _buildSelectTournament(context, th),
              ],
            ))))); */
  }

  Future<Map<String, dynamic>> val() async {
    final ref = FirebaseDatabase.instance.ref();
    final DataSnapshot snapshot = await ref.child('tournaments').get();

    Map<String, dynamic> thing = {};

    snapshot.children.forEach((element) {
      thing[element.key.toString()] = element.value;
    });

    return thing;
  }

  Widget _buildSelectTournament(
          BuildContext context, Map<String, dynamic> dat) =>
      ElevatedButton(
        child: Text(dat.keys.toList()[0]),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const NewTournament()),
          );
        },
      );
}
