import 'package:disc_golf/ChooseCoursePage.dart';
import 'package:disc_golf/HistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'AddScorePage.dart';
import 'Domain/Course.dart';
import 'Domain/Game.dart';
import 'Domain/Player.dart';
import 'Domain/Score.dart';
import 'Domain/databaseHelper.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title,}) : super(key: key);

  final String title;

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> with SingleTickerProviderStateMixin{

  Map scores = Map();
  Course course;
  Game game;


  @override
  void initState() {
    super.initState();
    _startUnfinishedGame();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return scores.length == 0 ? startPage() : gamePage();
  }

  Widget startPage() {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_startpage.jpg"), fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Discgolf", style: TextStyle(fontFamily: "Inter", fontSize: 60, color: Colors.white),),
              SizedBox(height: screenHeight * 0.10,),
              Opacity(
                opacity: 0.85,
                child: GestureDetector(
                  onTap: () => _newGame(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: const Color(0xFF43991C),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.19, vertical: screenHeight * 0.022),
                        child: Text("New game", style: TextStyle(fontFamily: "Inter", fontSize: 15, color: Colors.white),)
                    ),
                  ),
                ),
              ),
              Opacity(
                opacity: 0.85,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015, vertical: screenHeight * 0.015),
                  child: GestureDetector(
                    onTap: () => _history(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.20, vertical: screenHeight * 0.022),
                          child: Text("Score list", style: TextStyle(fontFamily: "Inter", fontSize: 15, color: Colors.black),)
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.2,),
            ],
          ),
        ),
      ),
    );
  }

  Widget gamePage(){
    var playerList = scores.keys.toList();
    var scoreList = scores.values.toList();
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.05, bottom: size.height * 0.05),
            child: SizedBox(
              height: size.height * 0.8,
              width: size.width,
              child: Swiper(
                loop: false,
                itemCount: course.numberOfHoles,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Hole no.", style: TextStyle(fontFamily: "Inter", color: Colors.black, fontSize: 18)),
                              Text(
                                  "Par " + course.getPar(index + 1).toString(),
                                  style: TextStyle(fontFamily: "Inter", color: Colors.grey, fontSize: 18)),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: size.height * 0.1),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(fontFamily: "Inter",color: Colors.black, fontSize: 145),
                                  ),
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      playerColumn("", 99, size),
                                      scores.length > 0 ? playerColumn(playerList[0].name, scoreList[0].getScoreFromHole(index+1), size) : Container(),
                                      scores.length > 1 ? playerColumn(playerList[1].name, scoreList[1].getScoreFromHole(index+1), size) : Container(),
                                      scores.length > 2 ? playerColumn(playerList[2].name, scoreList[2].getScoreFromHole(index+1), size) : Container(),
                                      scores.length > 3 ? playerColumn(playerList[3].name, scoreList[3].getScoreFromHole(index+1), size) : Container(),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: <Widget>[
                                      scoreColumn("", 99, size),
                                      scores.length > 0 ? scoreColumn(playerList[0].name, scoreList[0].getScoreFromHole(index+1), size) : Container(),
                                      scores.length > 1 ? scoreColumn(playerList[1].name, scoreList[1].getScoreFromHole(index+1), size) : Container(),
                                      scores.length > 2 ? scoreColumn(playerList[2].name, scoreList[2].getScoreFromHole(index+1), size) : Container(),
                                      scores.length > 3 ? scoreColumn(playerList[3].name, scoreList[3].getScoreFromHole(index+1), size) : Container(),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      totalScoreColumn("", 99, size),
                                      scores.length > 0 ? totalScoreColumn(playerList[0].name, scoreList[0].totalScore(), size) : Container(),
                                      scores.length > 1 ? totalScoreColumn(playerList[1].name, scoreList[1].totalScore(), size) : Container(),
                                      scores.length > 2 ? totalScoreColumn(playerList[2].name, scoreList[2].totalScore(), size) : Container(),
                                      scores.length > 3 ? totalScoreColumn(playerList[3].name, scoreList[3].totalScore(), size) : Container(),
                                    ],
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Center(
                                    child: GestureDetector(
                                        onTap: () => _addScore(index + 1),
                                        child: Text("+ Add score", style: TextStyle(fontFamily: "Inter", color: const Color(0xFF43991C),))
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  );
                },
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            ),
          ),

          GestureDetector(
            onTap: () => _finishGame(),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: const Color(0xFF43991C),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.19, vertical: size.height * 0.022),
                  child: Text("Finish round", style: TextStyle(fontFamily: "Inter", fontSize: 15, color: Colors.white),)
              ),
            ),
          ),

        ],
      ),
    );
  }

  _newGame() async {
    final result = await Navigator.push(context, MaterialPageRoute(
        builder: (context) => ChooseCoursePage()));
    if(result != null){
      scores = result[0];
      course = result[1];
      game = result[2];
    }
  }

  _history() async {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => HistoryPage()));
  }

  Widget playerColumn(String name, int throws, Size size){
    return Padding(
      padding: EdgeInsets.only(left: size.width * 0.1, top: 2, bottom: 2),
      child: Text(name, style: TextStyle(fontFamily: "Inter", color: Colors.grey)),
    );
  }

  Widget scoreColumn(String name, int throws, Size size){
    return Padding(
        padding: EdgeInsets.only(right: size.width * 0.05, top: 2, bottom: 2),
        child: throws == 99 ? Text("Throws", style: TextStyle(fontFamily: "Inter", color: Colors.grey)):
        throws == 0 ? Text("-", style: TextStyle(fontFamily: "Inter", color: Colors.grey)) :
        Text(throws.toString(), style: TextStyle(fontFamily: "Inter", color: Colors.grey)));
  }

  Widget totalScoreColumn(String name, int throws, Size size){
    return Padding(
        padding: EdgeInsets.only(right: size.width * 0.1, top: 2, bottom: 2),
        child: throws == 99 ? Text("Tot", style: TextStyle(fontFamily: "Inter", color: Colors.grey)):
        throws == 0 ? Text("-", style: TextStyle(fontFamily: "Inter", color: Colors.grey)) :
        Text(throws.toString(), style: TextStyle(fontFamily: "Inter", color: Colors.grey)));
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  Future<void> _addScore(int hole) async {
    Navigator.push(context,  MaterialPageRoute(
        builder: (context) => AddScorePage(scores: scores, hole: hole,)));
  }

  _finishGame() async {
    game.done = 1;
    setState(() {
      scores.clear();
    });
    DatabaseHelper helper = DatabaseHelper.instance;
    await helper.updateGame(game);
  }

  _startUnfinishedGame() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    game = await helper.queryUnfinishedGame();
    if(game != null){
      course = await helper.queryCourse(game.courseId);

      List<int> playerIdList = await helper.queryAllPlayersInGame(game.id);
      List<Player> playerList = [];
      for(int playerId in playerIdList){
        Player player = await helper.queryPlayer(playerId);
        playerList.add(player);
      }
      for(Player player in playerList){
        Score score = await helper.queryScoreForPlayer(game.id, player.id);
        setState(() {
          scores.putIfAbsent(player, () => score);
        });
      }
    }
  }
}