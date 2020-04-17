import 'package:disc_golf/StartPage.dart';

import 'package:flutter/material.dart';

import 'Alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final icons = [ Icons.sms, Icons.mail, Icons.phone ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disc golf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(title: "Disc golf",),
    );
  }
}
