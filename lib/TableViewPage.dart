import 'package:disc_golf/CustomBox.dart';
import 'package:disc_golf/HelperClass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'databaseHelper.dart';

class TableViewPage extends StatelessWidget {
  TableViewPage({Key key, @required this.player});

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 5.0,
              // has the effect of softening the shadow
              spreadRadius: 0.5,
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
          ])
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
            child: Text(
              player.name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: <Widget>[
                CustomBox(text: "1",),
                CustomBox(text: "2",),
                CustomBox(text: "3",),
                CustomBox(text: "4",),
                CustomBox(text: "5",),
                CustomBox(text: "6",),
                CustomBox(text: "7",),
                CustomBox(text: "8",),
                CustomBox(text: "9",),
                CustomBox(text: "out",),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              children: <Widget>[
                CustomBox(text: player.scoreOne.toString(),),
                CustomBox(text: player.scoreTwo.toString(),),
                CustomBox(text: player.scoreThree.toString(),),
                CustomBox(text: player.scoreFour.toString(),),
                CustomBox(text: player.scoreFive.toString(),),
                CustomBox(text: player.scoreSix.toString(),),
                CustomBox(text: player.scoreSeven.toString(),),
                CustomBox(text: player.scoreEight.toString(),),
                CustomBox(text: player.scoreNine.toString(),),
                CustomBox(text: HelperClass.playersTotalFirstNine(player).toString(),),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: <Widget>[
                CustomBox(text: "10",),
                CustomBox(text: "11",),
                CustomBox(text: "12",),
                CustomBox(text: "13",),
                CustomBox(text: "14",),
                CustomBox(text: "15",),
                CustomBox(text: "16",),
                CustomBox(text: "17",),
                CustomBox(text: "18",),
                CustomBox(text: "in",),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Row(
              children: <Widget>[
                CustomBox(text: player.scoreTen.toString(),),
                CustomBox(text: player.scoreEleven.toString(),),
                CustomBox(text: player.scoreTwelve.toString(),),
                CustomBox(text: player.scoreThirteen.toString(),),
                CustomBox(text: player.scoreFourteen.toString(),),
                CustomBox(text: player.scoreFifteen.toString(),),
                CustomBox(text: player.scoreSixteen.toString(),),
                CustomBox(text: player.scoreSeventeen.toString(),),
                CustomBox(text: player.scoreEighteen.toString(),),
                CustomBox(text: HelperClass.playersTotalLastNine(player).toString(),),
              ],
            ),
          )
        ],
      ),
    );
  }
}