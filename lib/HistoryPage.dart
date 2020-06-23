import 'dart:collection';

import 'package:disc_golf/Alert.dart';
import 'package:disc_golf/Domain/Game.dart';
import 'package:disc_golf/Domain/databaseHelper.dart';
import 'package:disc_golf/MSwitch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Domain/Course.dart';
import 'Domain/Player.dart';
import 'Domain/Score.dart';
import 'SummaryPage.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({
    Key key,
  }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  _HistoryPageState();

  TextEditingController controller = TextEditingController();
  Map games = Map();
  List<Player> players = [];
  List<Course> courses = [];
  Player selectedPlayer;
  Course selectedCourse;
  bool isSorted = true;
  LinkedHashMap sortedMap = LinkedHashMap();

  @override
  void initState(){
    super.initState();
    _setupPlayers();
    _setupCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          title: Text("History", style: TextStyle(fontFamily: "Inter", color: Colors.black)),
          backgroundColor: Colors.grey[300]),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<Player>(
                    isExpanded: true,
                    value: selectedPlayer,
                    items: players.map((Player player) {
                      return new DropdownMenuItem<Player>(
                        value: player,
                        child: new Text(player.name, style: TextStyle(fontFamily: "Inter",)),
                      );
                    }).toList(),
                    hint: Text("Choose player", style: TextStyle(fontFamily: "Inter",)),
                    onChanged: (player) {
                      setState(() {
                        selectedPlayer = player;
                      });
                      _getListOfGames();
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<Course>(
                    isExpanded: true,
                    value: selectedCourse,
                    items: courses.map((Course course) {
                      return new DropdownMenuItem<Course>(
                        value: course,
                        child: new Text(course.name, style: TextStyle(fontFamily: "Inter",)),
                      );
                    }).toList(),
                    hint: Text("Choose course", style: TextStyle(fontFamily: "Inter",)),
                    onChanged: (course) {
                      setState(() {
                        selectedCourse = course;
                      });
                      _getListOfGames();
                    },
                  ),
                ),
              )
            ],
          ),
          selectedPlayer != null && selectedCourse != null ?
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              isSorted ? Text("Date") : Text("Score"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MSwitch(
                    onChange: (value) {
                      _changeSortValue(value);
                    },
                  value: isSorted,
                ),
              ),
            ],
          ) : Container(),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemCount: games.length,
              itemBuilder: (BuildContext context, int index) {
                var gameList = games.keys.toList();
                var scoreList = games.values.toList();
                return Dismissible(
                  key: Key(gameList[index].id.toString()),
                  confirmDismiss: (DismissDirection direction) async {
                    Alert(
                      title: "Delete?",
                      context: context,
                      content: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text("Are you sure you wish to delete this game?", style: TextStyle(fontFamily: "Inter",)),
                          ),
                          Row(
                            children: <Widget>[
                              FlatButton(
                                child: Text("Yes", style: TextStyle(fontFamily: "Inter",)),
                                onPressed: () => _removeGame(gameList[index], scoreList[index]),
                              ),
                              Spacer(),
                              FlatButton(
                                child: Text("No", style: TextStyle(fontFamily: "Inter",)),
                                onPressed: () => Navigator.pop(context),
                              )
                            ],
                          )
                        ],
                      ),
                    ).show();
                  },
                  child: GestureDetector(
                    onTap: () => _showSummaryPage(gameList[index]),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 10.0,
                              // has the effect of softening the shadow
                              spreadRadius: 0.02,
                              // has the effect of extending the shadow
                              offset: Offset(
                                5.0,
                                5.0,
                              ),
                            )
                          ],
                          color: Colors.grey[200]),
                      height: 50,
                      child: LayoutBuilder(
                        builder:
                            (BuildContext context, BoxConstraints constraints) {
                          return Center(
                            child: Row(
                            children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Icon(Icons.flag, color: const Color(0xFF43991C),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(_getDate(gameList[index].date),
                                    style: TextStyle(fontFamily: "Inter",
                                        color: Colors.black, fontSize: 20),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: Text("Score: " + scoreList[index].totalScore().toString(), style: TextStyle(fontFamily: "Inter",
                                      color: Colors.black, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _setupPlayers() async {
    DatabaseHelper instance = DatabaseHelper.instance;
    var playerList = await instance.queryAllPlayers();

    setState(() {
      players = playerList;
    });
  }

  _setupCourses() async {
    DatabaseHelper instance = DatabaseHelper.instance;
    var courseList = await instance.queryAllCourses();

    setState(() {
      courses = courseList;
    });
  }

  _getListOfGames() async {
    if(selectedCourse != null && selectedPlayer != null){
      DatabaseHelper instance = DatabaseHelper.instance;
      Map gameMap = Map();
      var gameIdList = await instance.queryAllGamesFromPlayer(selectedPlayer.id);
      for(int gameId in gameIdList){
        Game game = await instance.queryGame(gameId);
        if(selectedCourse.id == game.courseId){
          Score score = await instance.queryScoreForPlayer(gameId, selectedPlayer.id);
          gameMap.putIfAbsent(game, () => score);
        }
      }
      setState(() {
        games = gameMap;
      });
      _changeSortValue(isSorted);
    }
  }

  _getDate(int intDate) {
    var year = DateTime.fromMillisecondsSinceEpoch(intDate).year.toString();
    var month = DateTime.fromMillisecondsSinceEpoch(intDate).month.toString();
    var day = DateTime.fromMillisecondsSinceEpoch(intDate).day.toString();
    return year + " - " + month + "/" + day;
  }

  _removeGame(Game game, Score score) {
    DatabaseHelper instance = DatabaseHelper.instance;
    instance.deleteScore(score.id);
    instance.deleteGamePlayerScore(game.id, score.id, selectedPlayer.id);
    setState(() {
      games.remove(game);
    });
    Navigator.pop(context);
  }

  _showSummaryPage(Game game) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => SummaryPage(game: game, course: selectedCourse,)));
  }

  _changeSortValue(value) {

    setState(() {
      isSorted = value;
    });

    if(value){
      var sortedKeys = games.keys.toList()..sort();
      setState(() {
        games = new LinkedHashMap
            .fromIterable(sortedKeys, key: (k) => k, value: (k) => games[k]);
      });
    } else {
      var sortedKeys = games.keys.toList(growable:false)
        ..sort((k1, k2) => games[k1].totalScore().compareTo(games[k2].totalScore()));
      setState(() {
        games = new LinkedHashMap
            .fromIterable(sortedKeys, key: (k) => k, value: (k) => games[k]);
      });
    }
  }
}
