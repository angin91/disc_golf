import 'package:disc_golf/CustomBox.dart';
import 'Player.dart';
import 'package:flutter/material.dart';

class ScoreTable extends StatelessWidget {
  ScoreTable({@required this.player});
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                CustomBox(text: "1"),
                CustomBox(text: "2"),
                CustomBox(text: "3"),
                CustomBox(text: "4"),
                CustomBox(text: "5"),
                CustomBox(text: "6"),
                CustomBox(text: "7"),
                CustomBox(text: "8"),
                CustomBox(text: "9"),
                CustomBox(text: "10"),
                CustomBox(text: "11"),
                CustomBox(text: "12"),
                CustomBox(text: "13"),
                CustomBox(text: "14"),
                CustomBox(text: "15"),
                CustomBox(text: "16"),
                CustomBox(text: "17"),
                CustomBox(text: "18"),
                CustomBox(text: "To"),
              ],
            ),
            Row(
              children: <Widget>[
                CustomBox(text: player.scoreOne.toString()),
                CustomBox(text: player.scoreTwo.toString()),
                CustomBox(text: player.scoreThree.toString()),
                CustomBox(text: player.scoreFour.toString()),
                CustomBox(text: player.scoreFive.toString()),
                CustomBox(text: player.scoreSix.toString()),
                CustomBox(text: player.scoreSeven.toString()),
                CustomBox(text: player.scoreEight.toString()),
                CustomBox(text: player.scoreNine.toString()),
                CustomBox(text: player.scoreTen.toString()),
                CustomBox(text: player.scoreEleven.toString()),
                CustomBox(text: player.scoreTwelve.toString()),
                CustomBox(text: player.scoreThirteen.toString()),
                CustomBox(text: player.scoreFourteen.toString()),
                CustomBox(text: player.scoreFifteen.toString()),
                CustomBox(text: player.scoreSixteen.toString()),
                CustomBox(text: player.scoreSeventeen.toString()),
                CustomBox(text: player.scoreEighteen.toString()),
                CustomBox(text: _totalScore().toString()),
              ],
            )
          ],
      ),
    );
  }

  int _totalScore(){
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
}