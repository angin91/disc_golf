import 'databaseHelper.dart';

class Score{

  int id;
  int scoreOne;
  int scoreTwo;
  int scoreThree;
  int scoreFour;
  int scoreFive;
  int scoreSix;
  int scoreSeven;
  int scoreEight;
  int scoreNine;
  int scoreTen;
  int scoreEleven;
  int scoreTwelve;
  int scoreThirteen;
  int scoreFourteen;
  int scoreFifteen;
  int scoreSixteen;
  int scoreSeventeen;
  int scoreEighteen;

  Score(){
    scoreOne = 0;
    scoreTwo = 0;
    scoreThree = 0;
    scoreFour = 0;
    scoreFive = 0;
    scoreSix = 0;
    scoreSeven = 0;
    scoreEight = 0;
    scoreNine = 0;
    scoreTen = 0;
    scoreEleven = 0;
    scoreTwelve = 0;
    scoreThirteen = 0;
    scoreFourteen = 0;
    scoreFifteen = 0;
    scoreSixteen = 0;
    scoreSeventeen = 0;
    scoreEighteen = 0;
  }

  Score.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseHelper.columnId];
    scoreOne = map[DatabaseHelper.columnScoreOne];
    scoreTwo = map[DatabaseHelper.columnScoreTwo];
    scoreThree = map[DatabaseHelper.columnScoreThree];
    scoreFour = map[DatabaseHelper.columnScoreFour];
    scoreFive = map[DatabaseHelper.columnScoreFive];
    scoreSix = map[DatabaseHelper.columnScoreSix];
    scoreSeven = map[DatabaseHelper.columnScoreSeven];
    scoreEight = map[DatabaseHelper.columnScoreEight];
    scoreNine = map[DatabaseHelper.columnScoreNine];
    scoreTen = map[DatabaseHelper.columnScoreTen];
    scoreEleven = map[DatabaseHelper.columnScoreEleven];
    scoreTwelve = map[DatabaseHelper.columnScoreTwelve];
    scoreThirteen = map[DatabaseHelper.columnScoreThirteen];
    scoreFourteen = map[DatabaseHelper.columnScoreFourteen];
    scoreFifteen = map[DatabaseHelper.columnScoreFifteen];
    scoreSixteen = map[DatabaseHelper.columnScoreSixteen];
    scoreSeventeen = map[DatabaseHelper.columnScoreSeventeen];
    scoreEighteen = map[DatabaseHelper.columnScoreEighteen];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseHelper.columnScoreOne: scoreOne,
      DatabaseHelper.columnScoreTwo: scoreTwo,
      DatabaseHelper.columnScoreThree: scoreThree,
      DatabaseHelper.columnScoreFour: scoreFour,
      DatabaseHelper.columnScoreFive: scoreFive,
      DatabaseHelper.columnScoreSix: scoreSix,
      DatabaseHelper.columnScoreSeven: scoreSeven,
      DatabaseHelper.columnScoreEight: scoreEight,
      DatabaseHelper.columnScoreNine: scoreNine,
      DatabaseHelper.columnScoreTen: scoreTen,
      DatabaseHelper.columnScoreEleven: scoreEleven,
      DatabaseHelper.columnScoreTwelve: scoreTwelve,
      DatabaseHelper.columnScoreThirteen: scoreThirteen,
      DatabaseHelper.columnScoreFourteen: scoreFourteen,
      DatabaseHelper.columnScoreFifteen: scoreFifteen,
      DatabaseHelper.columnScoreSixteen: scoreSixteen,
      DatabaseHelper.columnScoreSeventeen: scoreSeventeen,
      DatabaseHelper.columnScoreEighteen: scoreEighteen
    };
    if (id != null) {
      map[DatabaseHelper.columnId] = id;
    }
    return map;
  }

  int getScoreFromHole(int i) {
    switch (i) {
      case 1:
        return scoreOne;
      case 2:
        return scoreTwo;
      case 3:
        return scoreThree;
      case 4:
        return scoreFour;
      case 5:
        return scoreFive;
      case 6:
        return scoreSix;
      case 7:
        return scoreSeven;
      case 8:
        return scoreEight;
      case 9:
        return scoreNine;
      case 10:
        return scoreTen;
      case 11:
        return scoreEleven;
      case 12:
        return scoreTwelve;
      case 13:
        return scoreThirteen;
      case 14:
        return scoreFourteen;
      case 15:
        return scoreFifteen;
      case 16:
        return scoreSixteen;
      case 17:
        return scoreSeventeen;
      case 18:
        return scoreEighteen;
      default:
        return 0;
    }
  }

  setScore(int hole, int score) {
    switch (hole) {
      case 1:
        scoreOne = score;
        break;
      case 2:
        scoreTwo = score;
        break;
      case 3:
        scoreThree = score;
        break;
      case 4:
        scoreFour = score;
        break;
      case 5:
        scoreFive = score;
        break;
      case 6:
        scoreSix = score;
        break;
      case 7:
        scoreSeven = score;
        break;
      case 8:
        scoreEight = score;
        break;
      case 9:
        scoreNine = score;
        break;
      case 10:
        scoreTen = score;
        break;
      case 11:
        scoreEleven = score;
        break;
      case 12:
        scoreTwelve = score;
        break;
      case 13:
        scoreThirteen = score;
        break;
      case 14:
        scoreFourteen = score;
        break;
      case 15:
        scoreFifteen = score;
        break;
      case 16:
        scoreSixteen = score;
        break;
      case 17:
        scoreSeventeen = score;
        break;
      case 18:
        scoreEighteen = score;
        break;
      default:
    }
  }

  int totalScore(){
    return scoreOne +
        scoreTwo +
        scoreThree +
        scoreFour +
        scoreFive +
        scoreSix +
        scoreSeven +
        scoreEight +
        scoreNine +
        scoreTen +
        scoreEleven +
        scoreTwelve +
        scoreThirteen +
        scoreFourteen +
        scoreFifteen +
        scoreSixteen +
        scoreSeventeen +
        scoreEighteen;
  }
}