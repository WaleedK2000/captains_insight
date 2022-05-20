// ignore_for_file: file_names

import 'package:firebase_database/firebase_database.dart';

class Player {
  late DatabaseReference _id;
  String name = '';

  Map<String, dynamic> toJson() {
    return {'name': name};
  }
}
