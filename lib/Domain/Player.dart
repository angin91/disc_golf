import 'package:disc_golf/Domain/databaseHelper.dart';
import 'package:quiver/core.dart';

class Player implements Comparable<Player>{

  int id;
  String name;

  Player();

  Player.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseHelper.columnId];
    name = map[DatabaseHelper.columnName];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseHelper.columnName: name
    };
    if (id != null) {
      map[DatabaseHelper.columnId] = id;
    }
    return map;
  }

  bool operator ==(o) => o is Player && name == o.name && id == o.id;
  int get hashCode => hash2(name.hashCode, id.hashCode);

  @override
  int compareTo(Player other) {
    return name.toLowerCase().compareTo(other.name.toLowerCase());
  }
}