import 'package:disc_golf/CustomBox.dart';
import 'package:disc_golf/HelperClass.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'databaseHelper.dart';

class TotalScoreHomePage extends StatelessWidget {
  TotalScoreHomePage({Key key, @required this.player});

  final Player player;
  HelperClass helper = HelperClass();

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
                      player.name,
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
                          HelperClass.playersTotalScore(player).toString(),
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
    );
  }
}