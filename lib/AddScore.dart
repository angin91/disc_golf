import 'package:disc_golf/CustomButton.dart';
import 'databaseHelper.dart';
import 'package:flutter/material.dart';

class AddScore extends StatefulWidget {
  AddScore({Key key, this.player, this.hole}) : super(key: key);

  final Player player;
  final int hole;

  @override
  _AddScoreState createState() => _AddScoreState();
}

class _AddScoreState extends State<AddScore> {
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
//      backgroundColor: Color(0xff330099),
        appBar: AppBar(
          title: Text("Score", style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFF0D47A1),
        ),
        body: Center(
          child: GridView.count(
            crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
            children: <Widget>[
              CustomButton(onPressed: () {_addScore(1);Navigator.pop(context);Navigator.pop(context);}, buttonName: "1",),
              CustomButton(onPressed: () {_addScore(2);Navigator.pop(context);Navigator.pop(context);}, buttonName: "2",),
              CustomButton(onPressed: () {_addScore(3);Navigator.pop(context);Navigator.pop(context);}, buttonName: "3",),
              CustomButton(onPressed: () {_addScore(4);Navigator.pop(context);Navigator.pop(context);}, buttonName: "4",),
              CustomButton(onPressed: () {_addScore(5);Navigator.pop(context);Navigator.pop(context);}, buttonName: "5",),
              CustomButton(onPressed: () {_addScore(6);Navigator.pop(context);Navigator.pop(context);}, buttonName: "6",),
              CustomButton(onPressed: () {_addScore(7);Navigator.pop(context);Navigator.pop(context);}, buttonName: "7",),
              CustomButton(onPressed: () {_addScore(8);Navigator.pop(context);Navigator.pop(context);}, buttonName: "8",),
              CustomButton(onPressed: () {_addScore(9);Navigator.pop(context);Navigator.pop(context);}, buttonName: "9",),
              CustomButton(onPressed: () {_addScore(10);Navigator.pop(context);Navigator.pop(context);}, buttonName: "10",)
            ],
          ),
        ),
    );
  }

  _addScore(int score) async {
    setState(() {
      switch(widget.hole){
        case 1:
          widget.player.scoreOne = score;
          break;
        case 2:
          widget.player.scoreTwo = score;
          break;
        case 3:
          widget.player.scoreThree = score;
          break;
        case 4:
          widget.player.scoreFour = score;
          break;
        case 5:
          widget.player.scoreFive = score;
          break;
        case 6:
          widget.player.scoreSix = score;
          break;
        case 7:
          widget.player.scoreSeven = score;
          break;
        case 8:
          widget.player.scoreEight = score;
          break;
        case 9:
          widget.player.scoreNine = score;
          break;
        case 10:
          widget.player.scoreTen = score;
          break;
        case 11:
          widget.player.scoreEleven = score;
          break;
        case 12:
          widget.player.scoreTwelve = score;
          break;
        case 13:
          widget.player.scoreThirteen = score;
          break;
        case 14:
          widget.player.scoreFourteen = score;
          break;
        case 15:
          widget.player.scoreFifteen = score;
          break;
        case 16:
          widget.player.scoreSixteen = score;
          break;
        case 17:
          widget.player.scoreSeventeen = score;
          break;
        case 18:
          widget.player.scoreEighteen = score;
          break;
      }
    });

    DatabaseHelper helper = DatabaseHelper.instance;
    await helper.updatePlayer(widget.player);
  }
}
