import 'package:disc_golf/ChooseHole.dart';
import 'package:disc_golf/databaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

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
    final double screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    _setupPlayerList().then((playerList) {
      setState(() {
        players = playerList;
      });
    });
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              _showRemoveAll(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.mail),
            onPressed: () {
              _sendEmail(players);
            },
          ),
        ],
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index){
                  return SizedBox(height: 30,);
                },
                padding: EdgeInsets.all(screenWidth*0.05),
                itemCount: players.length,
                itemBuilder: (BuildContext context, int index) {
                  Player p = players[index];
                  return GestureDetector(
                    onLongPress: () => _showRemovePlayerDialog(context, index),
                    onTap: () => _addScore(index),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF2196F3),
                              blurRadius: 10.0,
                              // has the effect of softening the shadow
                              spreadRadius: 2.0,
                              // has the effect of extending the shadow
                              offset: Offset(
                                1.0,
                                1.0,
                              ),
                            )
                          ],
                          gradient: LinearGradient(colors: [
                            const Color(0xFF0D47A1),
                            const Color(0xFF2196F3)
                          ])),
                      height: 100,
                      child: LayoutBuilder(
                        builder: (BuildContext context, BoxConstraints constraints){
                        return Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(left: 20),
                                    width: constraints.maxWidth * 0.6,
                                    child: Text(
                                      _playersName(players[index]),
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                Spacer(),
                                Padding(
                                  padding: EdgeInsets.only(top: 18.0, right: 20),
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        "Total score:",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      Text(
                                        _playersTotalScore(players[index]).toString(),
                                        style: TextStyle(color: Colors.white, fontSize: 40),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                        },
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPlayerDialog(context),
        backgroundColor: Color(0xFF0D47A1),
        child: Icon(Icons.add),
      ),
    );
  }

  Future<List<Player>> _setupPlayerList() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.queryAllPlayers();
  }

  _createPlayer(String name) async {
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
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(player);
    player.id = id;
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

  int _playersTotalScore(Player player){
    return player.scoreOne +
        player.scoreTwo +
        player.scoreThree +
        player.scoreFour +
        player.scoreFive +
        player.scoreSix +
        player.scoreSeven +
        player.scoreEight +
        player.scoreNine +
        player.scoreTen +
        player.scoreEleven +
        player.scoreTwelve +
        player.scoreThirteen +
        player.scoreFourteen +
        player.scoreFifteen +
        player.scoreSixteen +
        player.scoreSeventeen +
        player.scoreEighteen;
  }

  _removePlayer(index) async {
    setState(() {
      players.removeAt(index);
    });
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
    AlertDialog addPlayerAlert = AlertDialog(
      title: Text("Add player"),
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

  _showRemoveAll(BuildContext context) {
    // set up the buttons
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed: () async {
        DatabaseHelper helper = DatabaseHelper.instance;
        await helper.queryClearDatabase();
        setState(() {
          players.clear();
        });
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog removePlayerAlert = AlertDialog(
      title: Text("Remove all players"),
      content: Text("Would you like to remove all player?"),
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

  _showRemovePlayerDialog(BuildContext context, int index) {
    // set up the buttons
    Widget noButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget yesButton = FlatButton(
      child: Text("Yes"),
      onPressed: () async {
        Player player = players[index];
        DatabaseHelper helper = DatabaseHelper.instance;
        await helper.deletePlayer(player.id);
        setState(() {
          players.removeAt(index);
        });
        Scaffold.of(context)
            .showSnackBar(SnackBar(
            content: Text(player.name + " dismissed"),
        backgroundColor: Colors.green,));
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

  _sendEmail(List<Player> players) async {
    String body = "";
    players.forEach((player) {
      body += player.name + ": \n"
          "1: " + player.scoreOne.toString() + "\n"
          "2: " + player.scoreTwo.toString() + "\n"
          "3: " + player.scoreThree.toString() + "\n"
          "4: " + player.scoreFour.toString() + "\n"
          "5: " + player.scoreFive.toString() + "\n"
          "6: " + player.scoreSix.toString() + "\n"
          "7: " + player.scoreSeven.toString() + "\n"
          "8: " + player.scoreEight.toString() + "\n"
          "9: " + player.scoreNine.toString() + "\n"
          "10: " + player.scoreTen.toString() + "\n"
          "11: " + player.scoreEleven.toString() + "\n"
          "12: " + player.scoreTwelve.toString() + "\n"
          "13: " + player.scoreThirteen.toString() + "\n"
          "14: " + player.scoreFourteen.toString() + "\n"
          "15: " + player.scoreFifteen.toString() + "\n"
          "16: " + player.scoreSixteen.toString() + "\n"
          "17: " + player.scoreSeventeen.toString() + "\n"
          "18: " + player.scoreEighteen.toString() + "\n"
          "\n\n\n";

    });
    FlutterEmailSender.send(
      Email(
        body: body,
        subject: "Score",
        recipients: ["angin.andreas@gmail.com"],
        isHTML: false
      )
    );
  }
}
