import 'package:disc_golf/Domain/Course.dart';
import 'package:disc_golf/Domain/databaseHelper.dart';
import 'package:flutter/material.dart';

import 'Domain/Game.dart';
import 'Domain/Player.dart';
import 'Domain/Score.dart';

class SummaryPage extends StatefulWidget {
  SummaryPage({Key key, @required this.game, @required this.course}) : super(key: key);

  final Course course;
  final Game game;

  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> {
  _SummaryPageState();

  Map scores = Map();

  @override
  void initState() {
    super.initState();
    _setupScore();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            title: Text("Game summary", style: TextStyle(fontFamily: "Inter", color: Colors.black)),
            backgroundColor: Colors.grey[300]),
        backgroundColor: Colors.grey[300],
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(child: Container()),
                scores.length > 0 ? Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(child: Text(scores.keys.toList()[0].name, style: TextStyle(fontFamily: "Inter",))),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Center(child: Text("Throws", style: TextStyle(fontFamily: "Inter", color: Colors.grey[600]))),
                      ),
                    ],
                  ),
                ) : Container(),
                scores.length > 1 ? Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(child: Text(scores.keys.toList()[1].name, style: TextStyle(fontFamily: "Inter",))),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Text("Throws", style: TextStyle(fontFamily: "Inter", color: Colors.grey[600])),
                      ),
                    ],
                  ),
                ) : Container(),
                scores.length > 2 ? Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(child: Text(scores.keys.toList()[2].name, style: TextStyle(fontFamily: "Inter",))),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Text("Throws", style: TextStyle(fontFamily: "Inter", color: Colors.grey[600])),
                      ),
                    ],
                  ),
                ): Container(),
                scores.length == 4 ? Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(child: Text(scores.keys.toList()[3].name, style: TextStyle(fontFamily: "Inter",))),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: Text("Throws", style: TextStyle(fontFamily: "Inter", color: Colors.grey[600])),
                      ),
                    ],
                  ),
                ): Container(),
              ],
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: widget.course.numberOfHoles,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(child: Center(child: Text((index+1).toString(), style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold)))),
                            scores.length > 0 ? Expanded(child: Center(child: Text(scores.values.toList()[0].getScoreFromHole(index + 1).toString(), style: TextStyle(fontFamily: "Inter", color: Colors.grey[600])))) : Container(),
                            scores.length > 1 ? Expanded(child: Center(child: Text(scores.values.toList()[1].getScoreFromHole(index + 1).toString(), style: TextStyle(fontFamily: "Inter", color: Colors.grey[600])))) : Container(),
                            scores.length > 2 ? Expanded(child: Center(child: Text(scores.values.toList()[2].getScoreFromHole(index + 1).toString(), style: TextStyle(fontFamily: "Inter", color: Colors.grey[600])))) : Container(),
                            scores.length == 4 ? Expanded(child: Center(child: Text(scores.values.toList()[3].getScoreFromHole(index + 1).toString(), style: TextStyle(fontFamily: "Inter", color: Colors.grey[600])))) : Container(),
                          ],
                        ),
                        Divider()
                      ],
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                children: <Widget>[
                  Expanded(child: Center(child: Text("Total", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold)))),
                  scores.length > 0 ? Expanded(child: Center(child: Text(scores.values.toList()[0].totalScore().toString(), style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold))),) : Container(),
                  scores.length > 1 ? Expanded(child: Center(child: Text(scores.values.toList()[1].totalScore().toString(), style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold))),) : Container(),
                  scores.length > 2 ? Expanded(child: Center(child: Text(scores.values.toList()[2].totalScore().toString(), style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold))),): Container(),
                  scores.length == 4 ? Expanded(child: Center(child: Text(scores.values.toList()[3].totalScore().toString(), style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.bold))),): Container(),
                ],
              ),
            )
          ],
        ));
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _setupScore() async {
    DatabaseHelper instance = DatabaseHelper.instance;
    List<int> playerIdList =
        await instance.queryAllPlayersInGame(widget.game.id);
    for (int playerId in playerIdList) {
      Player player = await instance.queryPlayer(playerId);
      Score score =
          await instance.queryScoreForPlayer(widget.game.id, playerId);
      setState(() {
        scores.putIfAbsent(player, () => score);
      });
    }
  }
}
