import 'databaseHelper.dart';

class GamePlayerScore{

  int gameId;
  int playerId;
  int scoreId;

  GamePlayerScore(int gameId, int playerId, int scoreId){
    this.gameId = gameId;
    this.playerId = playerId;
    this.scoreId = scoreId;
  }

  GamePlayerScore.fromMap(Map<String, dynamic> map) {
    gameId = map[DatabaseHelper.columnGameId];
    playerId = map[DatabaseHelper.columnPlayerId];
    scoreId = map[DatabaseHelper.columnScoreId];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseHelper.columnGameId: gameId,
      DatabaseHelper.columnPlayerId: playerId,
      DatabaseHelper.columnScoreId: scoreId
    };
    return map;
  }

}