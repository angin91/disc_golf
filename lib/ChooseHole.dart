import 'package:disc_golf/AddScore.dart';
import 'package:disc_golf/CustomButton.dart';
import 'databaseHelper.dart';
import 'package:flutter/material.dart';

class ChooseHole extends StatefulWidget {
  ChooseHole({Key key, this.player}) : super(key: key);

  final Player player;

  @override
  _ChooseHoleState createState() => _ChooseHoleState();
}

class _ChooseHoleState extends State<ChooseHole> {

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
//      backgroundColor: Color(0xff330099),
      appBar: AppBar(
        title: Text("Holes", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Center(
        child: GridView.count(
          padding: EdgeInsets.all(5),
          crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
          children: <Widget>[
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 1,)),);}, buttonName: "1", score: widget.player.scoreOne,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 2,)),);}, buttonName: "2", score: widget.player.scoreTwo,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 3,)),);}, buttonName: "3", score: widget.player.scoreThree,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 4,)),);}, buttonName: "4", score: widget.player.scoreFour,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 5,)),);}, buttonName: "5", score: widget.player.scoreFive,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 6,)),);}, buttonName: "6", score: widget.player.scoreSix,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 7,)),);}, buttonName: "7", score: widget.player.scoreSeven,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 8,)),);}, buttonName: "8", score: widget.player.scoreEight,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 9,)),);}, buttonName: "9", score: widget.player.scoreNine,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 10,)),);}, buttonName: "10", score: widget.player.scoreTen,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 11,)),);}, buttonName: "11", score: widget.player.scoreEleven,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 12,)),);}, buttonName: "12", score: widget.player.scoreTwelve,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 13,)),);}, buttonName: "13", score: widget.player.scoreThirteen,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 14,)),);}, buttonName: "14", score: widget.player.scoreFourteen,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 15,)),);}, buttonName: "15", score: widget.player.scoreFifteen,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 16,)),);}, buttonName: "16", score: widget.player.scoreSixteen,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 17,)),);}, buttonName: "17", score: widget.player.scoreSeventeen,),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 18,)),);}, buttonName: "18", score: widget.player.scoreEighteen,),
          ],
        ),
      ),
    );
  }
}
