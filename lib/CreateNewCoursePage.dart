import 'package:disc_golf/Domain/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'Alert.dart';
import 'Domain/Course.dart';
import 'EnterNumberPage.dart';

class CreateNewCoursePage extends StatefulWidget {
  CreateNewCoursePage({Key key}) : super(key: key);

  @override
  _CreateNewCoursePageState createState() => _CreateNewCoursePageState();
}

class _CreateNewCoursePageState extends State<CreateNewCoursePage> {
  TextEditingController controller = TextEditingController();
  String courseName = "New Course";
  int numberOfHoles = 18;
  Course course = Course();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create new course", style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.05, bottom: size.height * 0.05),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.flag, color: Colors.green, size: 25,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(courseName, style: TextStyle(
                            fontFamily: "Inter",
                            color: Colors.black,
                            fontSize: 25),),
                      ),
                      GestureDetector(
                          onTap: () => _changeName(),
                          child: Icon(Icons.edit, color: Colors.green, size: 20,)
                      ),
                    ]
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Number of holes    ", style: TextStyle(
                        fontFamily: "Inter", color: Colors.black, fontSize: 15),),
                    GestureDetector(
                        onTap: () => _removeOneHole(),
                        child: Icon(
                          Icons.remove_circle, color: Colors.green, size: 20,)
                    ),
                    Text(" " + numberOfHoles.toString() + " ", style: TextStyle(
                        fontFamily: "Inter", color: Colors.black, fontSize: 15),),
                    GestureDetector(
                        onTap: () => _addOneHole(),
                        child: Icon(
                          Icons.add_circle, color: Colors.green, size: 20,)
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.5,
                width: size.width * 0.3,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Text("Hole no",
                              style: TextStyle(fontFamily: "Inter", color: Colors
                                  .grey,)),
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(right: size.width * 0.04),
                            child: Text("Par", style: TextStyle(
                              fontFamily: "Inter", color: Colors.grey,)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: size.height * 0.45,
                      width: size.width * 0.25,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemCount: numberOfHoles,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              children: <Widget>[
                                Text((index + 1).toString(), style: TextStyle(
                                    fontFamily: "Inter", fontSize: 15)),
                                Spacer(),
                                Text(course.getPar(index + 1).toString(),
                                    style: TextStyle(
                                        fontFamily: "Inter", fontSize: 15)),
                                GestureDetector(
                                  child: Icon(
                                    Icons.edit, color: Colors.green, size: 15,),
                                  onTap: () => _updatePar(index + 1),
                                ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.05),
                child: GestureDetector(
                  onTap: () => _saveCourse(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: const Color(0xFF43991C),
                    ),
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.19,
                            vertical: size.height * 0.022),
                        child: Text("Save course", style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 15,
                            color: Colors.white),)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Course>> _getCourses() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.queryAllCourses();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  _removeOneHole() {
    if (numberOfHoles > 1) {
      setState(() {
        numberOfHoles--;
      });
    }
  }

  _addOneHole() {
    if (numberOfHoles < 18) {
      setState(() {
        numberOfHoles++;
      });
    }
  }

  _saveCourse() {
    setState(() {
      course.numberOfHoles = numberOfHoles;
      course.name = courseName;
    });
    DatabaseHelper helper = DatabaseHelper.instance;
    helper.insertCourse(course);
    Navigator.pop(context, course);
  }

  _updatePar(int hole) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => EnterNumberPage(title: "Enter par", buttonName: "Update par")));
    if(result != null){
      setState(() {
        course.updateHole(hole, int.parse(result[0]));
      });
    }
  }

  _changeName() {
    print("change name");
    Alert(
      context: context,
        title: "Change name",
        content: Padding(
          padding: EdgeInsets.only(bottom: 18.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                  decoration: InputDecoration(
                    icon: Icon(Icons.flag),
                    labelText: 'Course name',
                  )
              ),
              Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      courseName = controller.text;
                      controller.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {
                      controller.clear();
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  )
                ],
              )
            ],
          ),
        ),
    ).show();
  }
}
