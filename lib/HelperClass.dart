import 'databaseHelper.dart';


class HelperClass{

  static HelperClass _instance;
  factory HelperClass() => _instance ??= HelperClass._();

  HelperClass._();

  static int playersTotalScore(Player player){
    return player.scoreOne +
        player.scoreTwo +
        player.scoreThree +
        player.scoreFour +
        player.scoreFive +
        player.scoreSix +
        player.scoreSeven +
        player.scoreEight +
        player.scoreNine +
        player.scoreTen +
        player.scoreEleven +
        player.scoreTwelve +
        player.scoreThirteen +
        player.scoreFourteen +
        player.scoreFifteen +
        player.scoreSixteen +
        player.scoreSeventeen +
        player.scoreEighteen;
  }

  static int playersTotalFirstNine(Player player){
    return player.scoreOne +
        player.scoreTwo +
        player.scoreThree +
        player.scoreFour +
        player.scoreFive +
        player.scoreSix +
        player.scoreSeven +
        player.scoreEight +
        player.scoreNine;
  }

  static int playersTotalLastNine(Player player){
    return player.scoreTen +
        player.scoreEleven +
        player.scoreTwelve +
        player.scoreThirteen +
        player.scoreFourteen +
        player.scoreFifteen +
        player.scoreSixteen +
        player.scoreSeventeen +
        player.scoreEighteen;
  }
}