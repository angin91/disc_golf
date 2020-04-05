import 'package:disc_golf/CustomBox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'databaseHelper.dart';

class PreviewPage extends StatelessWidget {
  PreviewPage({Key key, @required this.players});

  final List<Player> players;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF42A5F5),
    appBar: AppBar(
    title: Text("Preview", style: TextStyle(color: Colors.white)),
    backgroundColor: Color(0xFF0D47A1),
    ),
    body: Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Flexible(
          child: ListView.separated(
            itemCount: players.length,
            separatorBuilder: (BuildContext context, int index){
              return SizedBox(
                height: 10,
              );
            },
            itemBuilder: (BuildContext context, int index) {
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
                    Text(players[index].name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                      ),),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 12),),
                        CustomBox(text: "1",),
                        CustomBox(text: "2",),
                        CustomBox(text: "3",),
                        CustomBox(text: "4",),
                        CustomBox(text: "5",),
                        CustomBox(text: "6",),
                        CustomBox(text: "7",),
                        CustomBox(text: "8",),
                        CustomBox(text: "9",),
                        CustomBox(text: "10",),
                        CustomBox(text: "11",),
                        CustomBox(text: "12",),
                        CustomBox(text: "13",),
                        CustomBox(text: "14",),
                        CustomBox(text: "15",),
                        CustomBox(text: "16",),
                        CustomBox(text: "17",),
                        CustomBox(text: "18",),
                        Padding(padding: EdgeInsets.only(right: 12),),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 12),),
                        CustomBox(text: players[index].scoreOne.toString(),),
                        CustomBox(text: players[index].scoreTwo.toString(),),
                        CustomBox(text: players[index].scoreThree.toString(),),
                        CustomBox(text: players[index].scoreFour.toString(),),
                        CustomBox(text: players[index].scoreFive.toString(),),
                        CustomBox(text: players[index].scoreSix.toString(),),
                        CustomBox(text: players[index].scoreSeven.toString(),),
                        CustomBox(text: players[index].scoreEight.toString(),),
                        CustomBox(text: players[index].scoreNine.toString(),),
                        CustomBox(text: players[index].scoreTen.toString(),),
                        CustomBox(text: players[index].scoreEleven.toString(),),
                        CustomBox(text: players[index].scoreTwelve.toString(),),
                        CustomBox(text: players[index].scoreThirteen.toString(),),
                        CustomBox(text: players[index].scoreFourteen.toString(),),
                        CustomBox(text: players[index].scoreFifteen.toString(),),
                        CustomBox(text: players[index].scoreSixteen.toString(),),
                        CustomBox(text: players[index].scoreSeventeen.toString(),),
                        CustomBox(text: players[index].scoreEighteen.toString(),),
                        Padding(padding: EdgeInsets.only(right: 12),),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    )
    );
  }
}