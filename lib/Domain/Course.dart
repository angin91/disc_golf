import 'databaseHelper.dart';
import 'package:quiver/core.dart';

class Course{

  int id;
  String name;
  int numberOfHoles;
  int parOne;
  int parTwo;
  int parThree;
  int parFour;
  int parFive;
  int parSix;
  int parSeven;
  int parEight;
  int parNine;
  int parTen;
  int parEleven;
  int parTwelve;
  int parThirteen;
  int parFourteen;
  int parFifteen;
  int parSixteen;
  int parSeventeen;
  int parEighteen;
  int distanceOne;
  int distanceTwo;
  int distanceThree;
  int distanceFour;
  int distanceFive;
  int distanceSix;
  int distanceSeven;
  int distanceEight;
  int distanceNine;
  int distanceTen;
  int distanceEleven;
  int distanceTwelve;
  int distanceThirteen;
  int distanceFourteen;
  int distanceFifteen;
  int distanceSixteen;
  int distanceSeventeen;
  int distanceEighteen;

  Course(){
    parOne = 3;
    parTwo = 3;
    parThree = 3;
    parFour = 3;
    parFive = 3;
    parSix = 3;
    parSeven = 3;
    parEight = 3;
    parNine = 3;
    parTen = 3;
    parEleven = 3;
    parTwelve = 3;
    parThirteen = 3;
    parFourteen = 3;
    parFifteen = 3;
    parSixteen = 3;
    parSeventeen = 3;
    parEighteen = 3;
  }

  Course.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseHelper.columnId];
    name = map[DatabaseHelper.columnName];
    numberOfHoles = map[DatabaseHelper.columnNumberOfHoles];
    parOne = map[DatabaseHelper.columnParOne];
    parTwo = map[DatabaseHelper.columnParTwo];
    parThree = map[DatabaseHelper.columnParThree];
    parFour = map[DatabaseHelper.columnParFour];
    parFive = map[DatabaseHelper.columnParFive];
    parSix = map[DatabaseHelper.columnParSix];
    parSeven = map[DatabaseHelper.columnParSeven];
    parEight = map[DatabaseHelper.columnParEight];
    parNine = map[DatabaseHelper.columnParNine];
    parTen = map[DatabaseHelper.columnParTen];
    parEleven = map[DatabaseHelper.columnParEleven];
    parTwelve = map[DatabaseHelper.columnParTwelve];
    parThirteen = map[DatabaseHelper.columnParThirteen];
    parFourteen = map[DatabaseHelper.columnParFourteen];
    parFifteen = map[DatabaseHelper.columnParFifteen];
    parSixteen = map[DatabaseHelper.columnParSixteen];
    parSeventeen = map[DatabaseHelper.columnParSeventeen];
    parEighteen = map[DatabaseHelper.columnParEighteen];
    distanceOne = map[DatabaseHelper.columnDistanceOne];
    distanceTwo = map[DatabaseHelper.columnDistanceTwo];
    distanceThree = map[DatabaseHelper.columnDistanceThree];
    distanceFour = map[DatabaseHelper.columnDistanceFour];
    distanceFive = map[DatabaseHelper.columnDistanceFive];
    distanceSix = map[DatabaseHelper.columnDistanceSix];
    distanceSeven = map[DatabaseHelper.columnDistanceSeven];
    distanceEight = map[DatabaseHelper.columnDistanceEight];
    distanceNine = map[DatabaseHelper.columnDistanceNine];
    distanceTen = map[DatabaseHelper.columnDistanceTen];
    distanceEleven = map[DatabaseHelper.columnDistanceEleven];
    distanceTwelve = map[DatabaseHelper.columnDistanceTwelve];
    distanceThirteen = map[DatabaseHelper.columnDistanceThirteen];
    distanceFourteen = map[DatabaseHelper.columnDistanceFourteen];
    distanceFifteen = map[DatabaseHelper.columnDistanceFifteen];
    distanceSixteen = map[DatabaseHelper.columnDistanceSixteen];
    distanceSeventeen = map[DatabaseHelper.columnDistanceSeventeen];
    distanceEighteen = map[DatabaseHelper.columnDistanceEighteen];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnNumberOfHoles: numberOfHoles,
      DatabaseHelper.columnParOne: parOne,
      DatabaseHelper.columnParTwo: parTwo,
      DatabaseHelper.columnParThree: parThree,
      DatabaseHelper.columnParFour: parFour,
      DatabaseHelper.columnParFive: parFive,
      DatabaseHelper.columnParSix: parSix,
      DatabaseHelper.columnParSeven: parSeven,
      DatabaseHelper.columnParEight: parEight,
      DatabaseHelper.columnParNine: parNine,
      DatabaseHelper.columnParTen: parTen,
      DatabaseHelper.columnParEleven: parEleven,
      DatabaseHelper.columnParTwelve: parTwelve,
      DatabaseHelper.columnParThirteen: parThirteen,
      DatabaseHelper.columnParFourteen: parFourteen,
      DatabaseHelper.columnParFifteen: parFifteen,
      DatabaseHelper.columnParSixteen: parSixteen,
      DatabaseHelper.columnParSeventeen: parSeventeen,
      DatabaseHelper.columnParEighteen: parEighteen,
      DatabaseHelper.columnDistanceOne: distanceOne,
      DatabaseHelper.columnDistanceTwo: distanceTwo,
      DatabaseHelper.columnDistanceThree: distanceThree,
      DatabaseHelper.columnDistanceFour: distanceFour,
      DatabaseHelper.columnDistanceFive: distanceFive,
      DatabaseHelper.columnDistanceSix: distanceSix,
      DatabaseHelper.columnDistanceSeven: distanceSeven,
      DatabaseHelper.columnDistanceEight: distanceEight,
      DatabaseHelper.columnDistanceNine: distanceNine,
      DatabaseHelper.columnDistanceTen: distanceTen,
      DatabaseHelper.columnDistanceEleven: distanceEleven,
      DatabaseHelper.columnDistanceTwelve: distanceTwelve,
      DatabaseHelper.columnDistanceThirteen: distanceThirteen,
      DatabaseHelper.columnDistanceFourteen: distanceFourteen,
      DatabaseHelper.columnDistanceFifteen: distanceFifteen,
      DatabaseHelper.columnDistanceSixteen: distanceSixteen,
      DatabaseHelper.columnDistanceSeventeen: distanceSeventeen,
      DatabaseHelper.columnDistanceEighteen: distanceEighteen
    };
    if (id != null) {
      map[DatabaseHelper.columnId] = id;
    }
    return map;
  }

  bool operator ==(o) => o is Course && name == o.name && id == o.id;
  int get hashCode => hash2(name.hashCode, id.hashCode);

  int getPar(int i) {
    switch (i) {
      case 1:
        return parOne;
      case 2:
        return parTwo;
      case 3:
        return parThree;
      case 4:
        return parFour;
      case 5:
        return parFive;
      case 6:
        return parSix;
      case 7:
        return parSeven;
      case 8:
        return parEight;
      case 9:
        return parNine;
      case 10:
        return parTen;
      case 11:
        return parEleven;
      case 12:
        return parTwelve;
      case 13:
        return parThirteen;
      case 14:
        return parFourteen;
      case 15:
        return parFifteen;
      case 16:
        return parSixteen;
      case 17:
        return parSeventeen;
      case 18:
        return parEighteen;
      default:
        return 0;
    }
  }

  void updateHole(int hole, int par) {
    switch (hole) {
      case 1:
        parOne = par;
        break;
      case 2:
        parTwo = par;
        break;
      case 3:
        parThree = par;
        break;
      case 4:
        parFour = par;
        break;
      case 5:
        parFive = par;
        break;
      case 6:
        parSix = par;
        break;
      case 7:
        parSeven = par;
        break;
      case 8:
        parEight = par;
        break;
      case 9:
        parNine = par;
        break;
      case 10:
        parTen = par;
        break;
      case 11:
        parEleven = par;
        break;
      case 12:
        parTwelve = par;
        break;
      case 13:
        parThirteen = par;
        break;
      case 14:
        parFourteen = par;
        break;
      case 15:
        parFifteen = par;
        break;
      case 16:
        parSixteen = par;
        break;
      case 17:
        parSeventeen = par;
        break;
      case 18:
        parEighteen = par;
        break;
      default:
    }
  }
}