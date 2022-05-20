import 'package:captains_insight/screens/data_screens/cc.dart';
import 'package:captains_insight/screens/data_screens/player_data.dart';
import 'package:captains_insight/screens/data_screens/player_list.dart';
import 'package:captains_insight/screens/home/home.dart';
import 'package:captains_insight/screens/tournaments/view_tournaments.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}
