import 'package:disc_golf/Domain/Score.dart';

import 'Domain/databaseHelper.dart';


class HelperClass{

  static const String newGame= "New game";
  static const String previousGame = "Previous games";
  static const Map holes = {1:3,2:3,3:3,4:3,5:3,6:3,7:3,8:3,9:3,10:3,11:3,12:3,13:3,14:3,15:3,16:3,17:3,18:3};

  static const List<String> popupMenuItems = <String>[newGame, previousGame];

  static HelperClass _instance;
  factory HelperClass() => _instance ??= HelperClass._();

  HelperClass._();

  static int totalScore(Score score){
    return score.scoreOne +
        score.scoreTwo +
        score.scoreThree +
        score.scoreFour +
        score.scoreFive +
        score.scoreSix +
        score.scoreSeven +
        score.scoreEight +
        score.scoreNine +
        score.scoreTen +
        score.scoreEleven +
        score.scoreTwelve +
        score.scoreThirteen +
        score.scoreFourteen +
        score.scoreFifteen +
        score.scoreSixteen +
        score.scoreSeventeen +
        score.scoreEighteen;
  }

  static int totalFirstNine(Score score){
    return score.scoreOne +
        score.scoreTwo +
        score.scoreThree +
        score.scoreFour +
        score.scoreFive +
        score.scoreSix +
        score.scoreSeven +
        score.scoreEight +
        score.scoreNine;
  }

  static int totalLastNine(Score score){
    return score.scoreTen +
        score.scoreEleven +
        score.scoreTwelve +
        score.scoreThirteen +
        score.scoreFourteen +
        score.scoreFifteen +
        score.scoreSixteen +
        score.scoreSeventeen +
        score.scoreEighteen;
  }
}