import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.onPressed, @required this.buttonName, @optionalTypeArgs this.height});
  final GestureTapCallback onPressed;
  final String buttonName;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      width: MediaQuery.of(context).size.width - 32,
      child: RawMaterialButton(
        fillColor: Color(0xFF0D47A1),
        splashColor: Color(0xFF2196F3),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                buttonName,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(Radius.circular(2000.0)),
          side: BorderSide(color: Colors.red)
        ),
      ),
    );
  }
}