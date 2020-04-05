import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  CustomBox({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: Center(child: Text(text, style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}