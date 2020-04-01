import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

final String tablePlayer = 'player';
final String columnId = '_id';
final String columnName = 'name';
final String columnScoreOne = 'scoreOne';
final String columnScoreTwo = 'scoreTwo';
final String columnScoreThree = 'scoreThree';
final String columnScoreFour = 'scoreFour';
final String columnScoreFive = 'scoreFive';
final String columnScoreSix = 'scoreSix';
final String columnScoreSeven = 'scoreSeven';
final String columnScoreEight = 'scoreEight';
final String columnScoreNine = 'scoreNine';
final String columnScoreTen = 'scoreTen';
final String columnScoreEleven = 'scoreEleven';
final String columnScoreTwelve = 'scoreTwelve';
final String columnScoreThirteen = 'scoreThirteen';
final String columnScoreFourteen = 'scoreFourteen';
final String columnScoreFifteen = 'scoreFifteen';
final String columnScoreSixteen = 'scoreSixteen';
final String columnScoreSeventeen = 'scoreSeventeen';
final String columnScoreEighteen = 'scoreEighteen';

class Player {

  int id;
  String name;
  int scoreOne;
  int scoreTwo;
  int scoreThree;
  int scoreFour;
  int scoreFive;
  int scoreSix;
  int scoreSeven;
  int scoreEight;
  int scoreNine;
  int scoreTen;
  int scoreEleven;
  int scoreTwelve;
  int scoreThirteen;
  int scoreFourteen;
  int scoreFifteen;
  int scoreSixteen;
  int scoreSeventeen;
  int scoreEighteen;


  Player();

  Player.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    name = map[columnName];
    scoreOne = map[columnScoreOne];
    scoreTwo = map[columnScoreTwo];
    scoreThree = map[columnScoreThree];
    scoreFour = map[columnScoreFour];
    scoreFive = map[columnScoreFive];
    scoreSix = map[columnScoreSix];
    scoreSeven = map[columnScoreSeven];
    scoreEight = map[columnScoreEight];
    scoreNine = map[columnScoreNine];
    scoreTen = map[columnScoreTen];
    scoreEleven = map[columnScoreEleven];
    scoreTwelve = map[columnScoreTwelve];
    scoreThirteen = map[columnScoreThirteen];
    scoreFourteen = map[columnScoreFourteen];
    scoreFifteen = map[columnScoreFifteen];
    scoreSixteen = map[columnScoreSixteen];
    scoreSeventeen = map[columnScoreSeventeen];
    scoreEighteen = map[columnScoreEighteen];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnName: name,
      columnScoreOne: scoreOne,
      columnScoreTwo: scoreTwo,
      columnScoreThree: scoreThree,
      columnScoreFour: scoreFour,
      columnScoreFive: scoreFive,
      columnScoreSix: scoreSix,
      columnScoreSeven: scoreSeven,
      columnScoreEight: scoreEight,
      columnScoreNine: scoreNine,
      columnScoreTen: scoreTen,
      columnScoreEleven: scoreEleven,
      columnScoreTwelve: scoreTwelve,
      columnScoreThirteen: scoreThirteen,
      columnScoreFourteen: scoreFourteen,
      columnScoreFifteen: scoreFifteen,
      columnScoreSixteen: scoreSixteen,
      columnScoreSeventeen: scoreSeventeen,
      columnScoreEighteen: scoreEighteen
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}

class DatabaseHelper {

  static final _databaseName = "Player.db";
  static final _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tablePlayer (
                $columnId INTEGER PRIMARY KEY,
                $columnName TEXT NOT NULL,
                $columnScoreOne INTEGER NOT NULL,
                $columnScoreTwo INTEGER NOT NULL,
                $columnScoreThree INTEGER NOT NULL,
                $columnScoreFour INTEGER NOT NULL,
                $columnScoreFive INTEGER NOT NULL,
                $columnScoreSix INTEGER NOT NULL,
                $columnScoreSeven INTEGER NOT NULL,
                $columnScoreEight INTEGER NOT NULL,
                $columnScoreNine INTEGER NOT NULL,
                $columnScoreTen INTEGER NOT NULL,
                $columnScoreEleven INTEGER NOT NULL,
                $columnScoreTwelve INTEGER NOT NULL,
                $columnScoreThirteen INTEGER NOT NULL,
                $columnScoreFourteen INTEGER NOT NULL,
                $columnScoreFifteen INTEGER NOT NULL,
                $columnScoreSixteen INTEGER NOT NULL,
                $columnScoreSeventeen INTEGER NOT NULL,
                $columnScoreEighteen INTEGER NOT NULL
              )
              ''');
  }


  Future<int> insert(Player player) async {
    Database db = await database;
    int id = await db.insert(tablePlayer, player.toMap());
    return id;
  }

  Future<Player> queryPlayer(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tablePlayer,
        columns: [columnId, columnName, columnScoreOne, columnScoreTwo, columnScoreThree, columnScoreFour, columnScoreFive,
          columnScoreSix, columnScoreSeven, columnScoreEight, columnScoreNine, columnScoreTen, columnScoreEleven, columnScoreTwelve,
          columnScoreThirteen, columnScoreFourteen, columnScoreFifteen, columnScoreSixteen, columnScoreSeventeen, columnScoreEighteen],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Player.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Player>> queryAllPlayers() async {
    Database db = await database;
    List<Map> maps = await db.query(tablePlayer);
    List<Player> players = List();
    maps.forEach((map) {
      players.add(Player.fromMap(map));
    });
    return players;
  }

  void queryClearDatabase() async {
    Database db = await database;
    await db.delete(tablePlayer);
  }

  Future<void> deletePlayer(int id) async {
    Database db = await database;
    await db.delete(tablePlayer,
      where: "_id = ?",
      whereArgs: [id],
    );
  }

  Future<void> updatePlayer(Player player) async {
    Database db = await database;

    await db.update(tablePlayer, player.toMap(),
    where: "_id = ?",
    whereArgs: [player.id]);
  }
}