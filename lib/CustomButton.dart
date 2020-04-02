import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {@required this.onPressed,
      @required this.buttonName,
      @optionalTypeArgs this.score});

  final GestureTapCallback onPressed;
  final String buttonName;
  final int score;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        color: Color(0xFF42A5F5),
        child: Center(
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
                      const Color(0xFF1976D2)
                    ])
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue[200], width: 1.0, style: BorderStyle.solid),
                      gradient: LinearGradient(colors: [
                        score == 0 || score == null ? const Color(0xFF0D47A1) : const Color(0xFF00796B),
                        score == 0 || score == null ? const Color(0xFF1976D2) : const Color(0xFF29A69A)
                      ])),
                  child: Center(
                    child: new Text(
                      buttonName,
                      style: TextStyle(color: Colors.white, fontSize: 60),
                    ),
                  ),
                ),
                top: 17,
                bottom: 17,
                left: 17,
                right: 17,
              ),
              CircularText(
                text: score != null ? Text("Current score: " + score.toString(),
                  style: TextStyle(
                    fontSize: 28
                  ),
                ): Text(""),
                position: CircularTextPosition.inside,
                startAngle: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}