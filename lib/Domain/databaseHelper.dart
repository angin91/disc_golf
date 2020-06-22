import 'dart:io';
import 'package:disc_golf/Domain/GamePlayerScore.dart';
import 'package:disc_golf/Domain/Score.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'Course.dart';
import 'Game.dart';
import 'Player.dart';

class DatabaseHelper {
  static final String columnId = 'id';

  final String tableGame = 'game';
  static final String columnCourseId = 'courseId';
  static final String columnDate = 'date';
  static final String columnDone = 'done';

  final String tableCourse = 'course';
  static final String columnNumberOfHoles = 'numberOfHoles';
  static final String columnParOne = 'parOne';
  static final String columnParTwo = 'parTwo';
  static final String columnParThree = 'parThree';
  static final String columnParFour = 'parFour';
  static final String columnParFive = 'parFive';
  static final String columnParSix = 'parSix';
  static final String columnParSeven = 'parSeven';
  static final String columnParEight = 'parEight';
  static final String columnParNine = 'parNine';
  static final String columnParTen = 'parTen';
  static final String columnParEleven = 'parEleven';
  static final String columnParTwelve = 'parTwelve';
  static final String columnParThirteen = 'parThirteen';
  static final String columnParFourteen = 'parFourteen';
  static final String columnParFifteen = 'parFifteen';
  static final String columnParSixteen = 'parSixteen';
  static final String columnParSeventeen = 'parSeventeen';
  static final String columnParEighteen = 'parEighteen';
  static final String columnDistanceOne = 'distanceOne';
  static final String columnDistanceTwo = 'distanceTwo';
  static final String columnDistanceThree = 'distanceThree';
  static final String columnDistanceFour = 'distanceFour';
  static final String columnDistanceFive = 'distanceFive';
  static final String columnDistanceSix = 'distanceSix';
  static final String columnDistanceSeven = 'distanceSeven';
  static final String columnDistanceEight = 'distanceEight';
  static final String columnDistanceNine = 'distanceNine';
  static final String columnDistanceTen = 'distanceTen';
  static final String columnDistanceEleven = 'distanceEleven';
  static final String columnDistanceTwelve = 'distanceTwelve';
  static final String columnDistanceThirteen = 'distanceThirteen';
  static final String columnDistanceFourteen = 'distanceFourteen';
  static final String columnDistanceFifteen = 'distanceFifteen';
  static final String columnDistanceSixteen = 'distanceSixteen';
  static final String columnDistanceSeventeen = 'distanceSeventeen';
  static final String columnDistanceEighteen = 'distanceEighteen';

  final String tablePlayer = 'player';
  static final String columnName = 'name';

  final String tableScore = 'score';
  static final String columnScoreOne = 'scoreOne';
  static final String columnScoreTwo = 'scoreTwo';
  static final String columnScoreThree = 'scoreThree';
  static final String columnScoreFour = 'scoreFour';
  static final String columnScoreFive = 'scoreFive';
  static final String columnScoreSix = 'scoreSix';
  static final String columnScoreSeven = 'scoreSeven';
  static final String columnScoreEight = 'scoreEight';
  static final String columnScoreNine = 'scoreNine';
  static final String columnScoreTen = 'scoreTen';
  static final String columnScoreEleven = 'scoreEleven';
  static final String columnScoreTwelve = 'scoreTwelve';
  static final String columnScoreThirteen = 'scoreThirteen';
  static final String columnScoreFourteen = 'scoreFourteen';
  static final String columnScoreFifteen = 'scoreFifteen';
  static final String columnScoreSixteen = 'scoreSixteen';
  static final String columnScoreSeventeen = 'scoreSeventeen';
  static final String columnScoreEighteen = 'scoreEighteen';

  final String tableGamePlayerScore = 'gamePlayerScore';
  static final String columnGameId = 'gameId';
  static final String columnPlayerId = 'playerId';
  static final String columnScoreId = 'scoreId';

  static final _databaseName = "Discgolf.db";
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
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableGame (
                $columnId INTEGER PRIMARY KEY,
                $columnCourseId INTEGER NOT NULL,
                $columnDate INTEGER NOT NULL,
                $columnDone INTEGER NOT NULL
              )
              ''');
    await db.execute('''
              CREATE TABLE $tableCourse (
                $columnId INTEGER PRIMARY KEY,
                $columnName STRING NOT NULL,
                $columnNumberOfHoles INTEGER NOT NULL,
                $columnParOne INTEGER,
                $columnDistanceOne INTEGER,
                $columnParTwo INTEGER,
                $columnDistanceTwo INTEGER,
                $columnParThree INTEGER,
                $columnDistanceThree INTEGER,
                $columnParFour INTEGER,
                $columnDistanceFour INTEGER,
                $columnParFive INTEGER,
                $columnDistanceFive INTEGER,
                $columnParSix INTEGER,
                $columnDistanceSix INTEGER,
                $columnParSeven INTEGER,
                $columnDistanceSeven INTEGER,
                $columnParEight INTEGER,
                $columnDistanceEight INTEGER,
                $columnParNine INTEGER,
                $columnDistanceNine INTEGER,
                $columnParTen INTEGER,
                $columnDistanceTen INTEGER,
                $columnParEleven INTEGER,
                $columnDistanceEleven INTEGER,
                $columnParTwelve INTEGER,
                $columnDistanceTwelve INTEGER,
                $columnParThirteen INTEGER,
                $columnDistanceThirteen INTEGER,
                $columnParFourteen INTEGER,
                $columnDistanceFourteen INTEGER,
                $columnParFifteen INTEGER,
                $columnDistanceFifteen INTEGER,
                $columnParSixteen INTEGER,
                $columnDistanceSixteen INTEGER,
                $columnParSeventeen INTEGER,
                $columnDistanceSeventeen INTEGER,
                $columnParEighteen INTEGER,
                $columnDistanceEighteen INTEGER
              )
              ''');
    await db.execute('''
              CREATE TABLE $tablePlayer (
                $columnId INTEGER PRIMARY KEY,
                $columnName TEXT NOT NULL
              )
              ''');
    await db.execute('''
              CREATE TABLE $tableScore (
                $columnId INTEGER PRIMARY KEY,
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
    await db.execute('''
              CREATE TABLE $tableGamePlayerScore (
                $columnGameId INTEGER NOT NULL,
                $columnPlayerId INTEGER NOT NULL,
                $columnScoreId INTEGER NOT NULL
              )
              ''');
  }

  Future<int> insertGame(Game game) async {
    Database db = await database;
    int id = await db.insert(tableGame, game.toMap());
    return id;
  }

  Future<int> insertCourse(Course course) async {
    Database db = await database;
    int id = await db.insert(tableCourse, course.toMap());
    return id;
  }

  Future<int> insertPlayer(Player player) async {
    Database db = await database;
    int id = await db.insert(tablePlayer, player.toMap());
    return id;
  }

  Future<int> insertScore(Score score) async {
    Database db = await database;
    int id = await db.insert(tableScore, score.toMap());
    return id;
  }

  Future<void> insertGamePlayerScore(GamePlayerScore gamePlayerScore) async {
    Database db = await database;
    await db.insert(tableGamePlayerScore, gamePlayerScore.toMap());
  }

  Future<Game> queryGame(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableGame,
        columns: [columnId, columnCourseId, columnDate],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Game.fromMap(maps.first);
    }
    return null;
  }

  Future<Course> queryCourse(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableCourse,
        columns: [columnId, columnName, columnNumberOfHoles, columnParOne, columnParTwo, columnParThree,
          columnParFour, columnParFive, columnParSix, columnParSeven, columnParEight, columnParNine,
          columnParTen, columnParEleven, columnParTwelve, columnParThirteen, columnParFourteen, columnParFifteen,
          columnParSixteen, columnParSeventeen, columnParEighteen],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Course.fromMap(maps.first);
    }
    return null;
  }

  Future<Player> queryPlayer(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tablePlayer,
        columns: [columnId, columnName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Player.fromMap(maps.first);
    }
    return null;
  }

  Future<Score> queryScore(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableScore,
        columns: [
          columnId,
          columnScoreOne,
          columnScoreTwo,
          columnScoreThree,
          columnScoreFour,
          columnScoreFive,
          columnScoreSix,
          columnScoreSeven,
          columnScoreEight,
          columnScoreNine,
          columnScoreTen,
          columnScoreEleven,
          columnScoreTwelve,
          columnScoreThirteen,
          columnScoreFourteen,
          columnScoreFifteen,
          columnScoreSixteen,
          columnScoreSeventeen,
          columnScoreEighteen
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Score.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Game>> queryAllGames() async {
    Database db = await database;
    List<Map> maps = await db.query(tableGame);
    List<Game> games = List();
    maps.forEach((map) {
      games.add(Game.fromMap(map));
    });
    return games;
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

  Future<List<Course>> queryAllCourses() async {
    Database db = await database;
    List<Map> maps = await db.query(tableCourse);
    List<Course> courses = List();
    maps.forEach((map) {
      courses.add(Course.fromMap(map));
    });
    return courses;
  }

  void queryClearDatabase() async {
    Database db = await database;
    await db.delete(tableGame);
    await db.delete(tablePlayer);
    await db.delete(tableScore);
    await db.delete(tableGamePlayerScore);
  }

  Future<void> deletePlayer(int id) async {
    Database db = await database;
    await db.delete(
      tablePlayer,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteScore(int id) async {
    Database db = await database;
    await db.delete(
      tableScore,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<void> deleteGamePlayerScore(int gameId, int scoreId, int playerId) async {
    Database db = await database;
    await db.delete(
      tableGamePlayerScore,
      where: "$columnGameId = ? and $columnScoreId = ? and $columnPlayerId = ?",
      whereArgs: [gameId, scoreId, playerId],
    );
  }

  Future<void> updatePlayer(Player player) async {
    Database db = await database;

    await db.update(tablePlayer, player.toMap(),
        where: "id = ?", whereArgs: [player.id]);
  }

  Future<void> updateGame(Game game) async {
    Database db = await database;

    await db
        .update(tableGame, game.toMap(), where: "id = ?", whereArgs: [game.id]);
  }

  Future<void> updateScore(Score score) async {
    Database db = await database;

    await db.update(tableScore, score.toMap(),
        where: "id = ?", whereArgs: [score.id]);
  }

  Future<void> updateCourse(Course course) async {
    Database db = await database;

    await db.update(tableCourse, course.toMap(),
        where: "id = ?", whereArgs: [course.id]);
  }

  Future<Score> getScoreFromPlayerAndGame(int playerId, int gameId) async {
    Database db = await database;
    List<Map> maps = await db.query(tableGamePlayerScore,
        columns: [columnScoreId],
        where: '$columnGameId = ? and $columnPlayerId',
        whereArgs: [gameId, playerId]);
    if (maps.length > 0) {
      GamePlayerScore gps = GamePlayerScore.fromMap(maps.first);
      return queryScore(gps.scoreId);
    }
    return null;
  }

  Future<Game> queryUnfinishedGame() async {
    Database db = await database;
    List<Map> maps = await db.query(tableGame,
        columns: [columnId, columnCourseId, columnDate],
        where: '$columnDone = ?',
        whereArgs: [0]);
    if (maps.length > 0) {
      return Game.fromMap(maps.first);
    }
    return null;
  }

  Future<List<int>> queryAllPlayersInGame(int gameId) async {
    List<int> playerIds = List();
    Database db = await database;
    List<Map> maps = await db.query(tableGamePlayerScore,
        columns: [columnGameId, columnPlayerId, columnScoreId],
        where: '$columnGameId = ?',
        whereArgs: [gameId]);

    maps.forEach((map) {
      GamePlayerScore gps = GamePlayerScore.fromMap(map);
      playerIds.add(gps.playerId);
    });
    return playerIds;
  }

  Future<Score> queryScoreForPlayer(int gameId, int playerId) async {
    Database db = await database;
    List<Map> maps = await db.query(tableGamePlayerScore,
        columns: [columnGameId, columnPlayerId, columnScoreId],
        where: '$columnGameId = ? and $columnPlayerId = ?',
        whereArgs: [gameId, playerId]);

    if (maps.length > 0) {
      GamePlayerScore gps = GamePlayerScore.fromMap(maps.first);
      Score score = await queryScore(gps.scoreId);
      return score;
    }
    return null;
  }

  Future<List<int>> queryAllGamesFromPlayer(int playerId) async {
    Database db = await database;
    List<Map> maps = await db.query(tableGamePlayerScore,
        columns: [columnGameId, columnPlayerId, columnScoreId],
        where: '$columnPlayerId = ?',
        whereArgs: [playerId]);
        List<int> games = List();
        maps.forEach((map) {
          games.add(GamePlayerScore.fromMap(map).gameId);
        });
    return games;
  }
}
