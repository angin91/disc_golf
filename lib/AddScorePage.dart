import 'package:disc_golf/Domain/databaseHelper.dart';
import 'package:disc_golf/EnterNumberPage.dart';
import 'package:flutter/material.dart';

class AddScorePage extends StatefulWidget {
  AddScorePage({Key key, @required this.scores, @required this.hole}) : super(key: key);

  final Map scores;
  final int hole;

  @override
  _AddScorePageState createState() => _AddScorePageState();
}

class _AddScorePageState extends State<AddScorePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    var playerList = widget.scores.keys.toList();
    var scoreList = widget.scores.values.toList();
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          title: Text("Add score", style: TextStyle(fontFamily: "Inter", color: Colors.black,)),
          backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.05,
                  horizontal: screenWidth * 0.10),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15,
                );
              },
              itemCount: widget.scores.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () => _addScore(scoreList[index]),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            // has the effect of softening the shadow
                            spreadRadius: 0.02,
                            // has the effect of extending the shadow
                            offset: Offset(
                              5.0,
                              5.0,
                            ),
                          )
                        ],
                        color: Colors.white),
                    height: 100,
                    child: Center(
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              playerList[index].name,
                              style: TextStyle(fontFamily: "Inter", color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: scoreList[index].getScoreFromHole(widget.hole) == 0 ?
                            Text("+ Add Throws", style: TextStyle(fontFamily: "Inter", color: Colors.green, fontSize: 12))
                            :Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Text("Throws", style: TextStyle(fontFamily: "Inter", color: Colors.grey)),
                                ),
                                Text(scoreList[index].getScoreFromHole(widget.hole).toString(), style: TextStyle(fontFamily: "Inter", color: Colors.grey))
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: const Color(0xFF43991C),
                ),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.19, vertical: screenHeight * 0.022),
                    child: Text("Save score", style: TextStyle(fontFamily: "Inter", fontSize: 15, color: Colors.white),)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _addScore(score) async {
    final result = await Navigator.push(context, MaterialPageRoute(
        builder: (context) => EnterNumberPage(title: "Enter number of throws", buttonName: "Submit",)));
    DatabaseHelper instance = DatabaseHelper.instance;
    if(result != null){
      setState(() {
        score.setScore(widget.hole, int.parse(result));
      });
      instance.updateScore(score);
    }
  }
}
