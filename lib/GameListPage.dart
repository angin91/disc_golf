import 'Domain/Game.dart';
import 'Domain/databaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GameListPage extends StatefulWidget {
  GameListPage({Key key, this.title, this.game}) : super(key: key);

  final Game game;
  final String title;

  @override
  _GameListPageState createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  TextEditingController controller = TextEditingController();
  bool totalPage = true;
  List<Game> games = [];

  @override
  Widget build(BuildContext context) {
    setupAllGames();
    final double screenWidth = MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title, style: TextStyle(color: Colors.white)),
//        backgroundColor: Color(0xFF0D47A1),
//      ),
//      backgroundColor: Color(0xFF42A5F5),
//      body: Column(
//        children: <Widget>[
//          Flexible(
//            child: ListView.separated(
//                separatorBuilder: (BuildContext context, int index){
//                  return SizedBox(height: 30,);
//                },
//                padding: EdgeInsets.all(screenWidth*0.05),
//                itemCount: games.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return GestureDetector(
//                    onTap: () => _getGame(games[index], context),
//                    child: Dismissible(
//                        confirmDismiss: (DismissDirection direction) async {
//                          _showRemoveGameDialog(context, games[index]);
//                        },
//                        key: Key(games[index].id.toString()),
//                        onDismissed: (direction) {
//                          _showRemovePlayerDialog(context, games[index]);
//                        },
//                        child: totalPage ? TotalScoreHomePage(player: player, score: scores[player],) : TableViewPage(player: player, score: scores[player])
//                    ),
//                  );
//                }),
//          )
//        ],
//      ),
    );
  }

  setupAllGames() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    await helper.queryAllGames().then((gameList){
      setState(() {
        games = gameList;
      });
    });
  }

  @override
  void setState(fn) {
    if(mounted){
      super.setState(fn);
    }
  }
}
