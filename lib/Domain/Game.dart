import 'databaseHelper.dart';

class Game implements Comparable<Game>{

  int id;
  int courseId;
  int date;
  int done;

  Game(){
    done = 0;
  }


  Game.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseHelper.columnId];
    courseId = map[DatabaseHelper.columnCourseId];
    date = map[DatabaseHelper.columnDate];
    done = map[DatabaseHelper.columnDone];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseHelper.columnCourseId: courseId,
      DatabaseHelper.columnDate: date,
      DatabaseHelper.columnDone: done
    };
    if (id != null) {
      map[DatabaseHelper.columnId] = id;
    }
    return map;
  }

  @override
  int compareTo(Game other) {
    return date - other.date;
  }
}