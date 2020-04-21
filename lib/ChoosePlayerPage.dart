import 'package:disc_golf/Domain/GamePlayerScore.dart';
import 'package:disc_golf/Domain/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'Domain/Course.dart';
import 'Domain/Game.dart';
import 'Domain/Player.dart';
import 'Domain/Score.dart';

class ChoosePlayerPage extends StatefulWidget {
  ChoosePlayerPage({Key key, @required this.course}) : super(key: key);

  final Course course;

  @override
  _ChoosePlayerPageState createState() => _ChoosePlayerPageState(course);
}

class _ChoosePlayerPageState extends State<ChoosePlayerPage> {

  _ChoosePlayerPageState(Course course){
    this.course = course;
  }

  Course course;
  TextEditingController controller = TextEditingController();
  List<Player> players = [];
  List<Player> selected = [];

  @override
  void initState() {
    super.initState();
    _getPlayers().then((playerList) {
      setState(() {
        players = playerList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            title: Text("Choose players", style: TextStyle(fontFamily: "Inter", color: Colors.black)),
            backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: (players == null || players.length == 0)
            ? addFirstPlayer()
            : playerList(screenHeight, screenWidth, context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "startGame",
          onPressed: () => _startGame(context),
          backgroundColor: Color(0xFF43991C),
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Text("Start game", style: TextStyle(fontFamily: "Inter",)),
          ),
        )
    );
  }

  Widget addFirstPlayer() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: GestureDetector(
          onTap: () => _showAddPlayerDialog(context),
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
                  color: Colors.white),
              height: 100,
              child: Center(
                child: Text(
                  "+ Add first player",
                  style: TextStyle(fontFamily: "Inter", color: const Color(0xFF43991C)),
                ),
              )),
        ),
      ),
    );
  }

  Widget playerList(screenHeight, screenWidth, BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.10),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: players.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => _addPlayerToGame(players[index], context),
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
                      color: Colors.white),
                  height: 50,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Center(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Text(
                                players[index].name,
                                style: TextStyle(fontFamily: "Inter",
                                      color: Colors.black, fontSize: 20),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: selected.contains(players[index]) ? const Color(0xFF43991C) : Colors.white,
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Icon(Icons.check, color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 80, top: 10),
          child: GestureDetector(
              onTap: () => _showAddPlayerDialog(context),
              child: Text(
                "+ Add more player",
                style: TextStyle(fontFamily: "Inter", color: const Color(0xFF43991C)),
              )),
        ),
      ],
    );
  }

  Future<List<Player>> _getPlayers() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.queryAllPlayers();
  }

  _createPlayer(String name) async {
    var player = Player();
    player.name = name;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insertPlayer(player);
    player.id = id;
    setState(() {
      players.add(player);
    });
    return player;
  }

  _showAddPlayerDialog(BuildContext context) {
    Widget okButton = FlatButton(
      onPressed: () {
        _createPlayer(controller.text);
        controller.clear();
        Navigator.pop(context);
      },
      child: Text("OK", style: TextStyle(fontFamily: "Inter",)),
    );

    Widget cancelButton = FlatButton(
      onPressed: () {
        setState(() {
          controller.clear();
          Navigator.pop(context);
        });
      },
      child: Text("Cancel", style: TextStyle(fontFamily: "Inter",)),
    );

    // set up the AlertDialog
    AlertDialog addPlayerAlert = AlertDialog(
      title: Text("Add player", style: TextStyle(fontFamily: "Inter",)),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(helperText: "Enter name"),
        maxLines: 1,
      ),
      actions: <Widget>[okButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return addPlayerAlert;
      },
    );
  }

  _addPlayerToGame(Player player, BuildContext context) {
    if (selected.contains(player)) {
      setState(() {
        selected.remove(player);
      });
    } else {
      if(selected.length == 4){
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text("You can only add 4 players in a game", style: TextStyle(fontFamily: "Inter",)),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ));
      }else{
        setState(() {
          selected.add(player);
        });
      }
    }
  }

  _startGame(BuildContext context) async {
    DatabaseHelper helper = DatabaseHelper.instance;
    Map scores = Map();
    Game game = Game();
    game.date = DateTime.now().millisecondsSinceEpoch;
    game.courseId = widget.course.id;
    int gameId = await helper.insertGame(game);
    game.id = gameId;
    for (Player p in selected) {
      Score score = Score();
      int scoreId = await helper.insertScore(score);
      print("insert score: " +scoreId.toString());
      score.id = scoreId;
      scores.putIfAbsent(p, () => score);
      print("insert gps: " + gameId.toString());
      GamePlayerScore gamePlayerScore = GamePlayerScore(gameId, p.id, scoreId);
      await helper.insertGamePlayerScore(gamePlayerScore);
    }
    Navigator.pop(context);
    Navigator.pop(context, [scores, widget.course, game]);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

}
