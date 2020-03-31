import 'package:disc_golf/ChooseHole.dart';
import 'package:disc_golf/Player.dart';
import 'package:disc_golf/ScoreTable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ScoreTable.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  List players = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color(0xff330099),
        appBar: AppBar(
          title: Text(widget.title, style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF0D47A1),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _showAddPlayerDialog(context);
                });
              },
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Flexible(
              child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _addScore(index),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [const Color(0xFF0D47A1), const Color(0xFF2196F3) ])
                            ),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Center(
                                      child: Text(
                                    _playersName(players[index]),
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Container(
                                  child: FlatButton(
                                    child: IconButton(
                                      icon: Icon(Icons.remove_circle),
                                      onPressed: () {
                                        _showRemovePlayerDialog(context, index);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ScoreTable(
                          player: players[index],
                        )
                      ],
                    );
                  }),
            )
          ],
        ));
  }

  Player _createPlayer(String name) {
    var player = Player();
    player.name = name;
    player.scoreOne = 0;
    player.scoreTwo = 0;
    player.scoreThree = 0;
    player.scoreFour = 0;
    player.scoreFive = 0;
    player.scoreSix = 0;
    player.scoreSeven = 0;
    player.scoreEight = 0;
    player.scoreNine = 0;
    player.scoreTen = 0;
    player.scoreEleven = 0;
    player.scoreTwelve = 0;
    player.scoreThirteen = 0;
    player.scoreFourteen = 0;
    player.scoreFifteen = 0;
    player.scoreSixteen = 0;
    player.scoreSeventeen = 0;
    player.scoreEighteen = 0;
    setState(() {
      players.add(player);
    });
    return player;
  }

  String _playersName(Player player) {
    return player.name;
  }

  _addScore(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChooseHole(
                player: players[index],
              )),
    );
  }

  _showAddPlayerDialog(BuildContext context) {

    Widget okButton = FlatButton(
      onPressed: () {
        _createPlayer(controller.text);
        controller.clear();
        Navigator.pop(context);
      },
      child: Text("OK"),
    );

    Widget cancelButton = FlatButton(
      onPressed: () {
        setState(() {
          controller.clear();
          Navigator.pop(context);
        });
      },
      child: Text("Cancel"),
    );

    // set up the AlertDialog
    AlertDialog addPlayerAlert =  AlertDialog(
      title: Text("Add player"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(helperText: "Enter name"),
        maxLines: 1,
      ),
      actions: <Widget>[
        okButton,
        cancelButton
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return addPlayerAlert;
      },
    );
  }

  _showRemovePlayerDialog(BuildContext context, int index) {

    // set up the buttons
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed:  () {
        Navigator.pop(context);
      },
    );
    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed:  () {
        setState(() {
          players.removeAt(index);
        });
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog removePlayerAlert = AlertDialog(
      title: Text("Remove player"),
      content: Text("Would you like to remove the player?"),
      actions: [
        yesButton,
        noButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return removePlayerAlert;
      },
    );
  }
}
