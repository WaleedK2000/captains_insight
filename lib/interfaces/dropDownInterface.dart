import 'package:captains_insight/services/database.dart';

abstract class DropDownInterface {
  Database db = Database();

  List<String> getCountryList() {
    return db.getCountryList();
  }
}
