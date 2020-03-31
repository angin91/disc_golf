import 'package:disc_golf/AddScore.dart';
import 'package:disc_golf/CustomButton.dart';
import 'Player.dart';
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
        title: Text("Hole", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF0D47A1),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          childAspectRatio: (orientation == Orientation.portrait) ? 1.0 : 1.3,
          children: <Widget>[
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 1,)),);}, buttonName: "1",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 2,)),);}, buttonName: "2",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 3,)),);}, buttonName: "3",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 4,)),);}, buttonName: "4",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 5,)),);}, buttonName: "5",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 6,)),);}, buttonName: "6",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 7,)),);}, buttonName: "7",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 8,)),);}, buttonName: "8",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 9,)),);}, buttonName: "9",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 10,)),);}, buttonName: "10",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 11,)),);}, buttonName: "11",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 12,)),);}, buttonName: "12",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 13,)),);}, buttonName: "13",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 14,)),);}, buttonName: "14",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 15,)),);}, buttonName: "15",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 16,)),);}, buttonName: "16",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 17,)),);}, buttonName: "17",),
            CustomButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => AddScore(player: widget.player, hole: 18,)),);}, buttonName: "18",),
          ],
        ),
      ),
    );
  }
}
