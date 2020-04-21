import 'package:disc_golf/ChoosePlayerPage.dart';
import 'package:disc_golf/CreateNewCoursePage.dart';
import 'package:disc_golf/Domain/databaseHelper.dart';
import 'package:flutter/material.dart';
import 'Domain/Course.dart';

class ChooseCoursePage extends StatefulWidget {
  ChooseCoursePage({Key key}) : super(key: key);

  @override
  _ChooseCoursePageState createState() => _ChooseCoursePageState();
}

class _ChooseCoursePageState extends State<ChooseCoursePage>
    with SingleTickerProviderStateMixin {
  TextEditingController controller = TextEditingController();
  List<Course> courses = [];
  Course selected;

  @override
  void initState() {
    super.initState();
    _getCourses().then((courseList) {
      setState(() {
        courses = courseList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0.0,
            title: Text("Choose course", style: TextStyle(fontFamily: "Inter",color: Colors.black)),
            backgroundColor: Colors.white),
        backgroundColor: Colors.white,
        body: (courses == null || courses.length == 0)
            ? addFirstCourse()
            : courseList(screenHeight, screenWidth),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          heroTag: "next",
          onPressed: () => _choosePlayer(context),
          backgroundColor: Color(0xFF43991C),
          label: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
            child: Text("Next", style: TextStyle(fontFamily: "Inter",)),
          ),
        ));
  }

  Widget addFirstCourse() {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        child: GestureDetector(
          onTap: () => _showAddCourse(context),
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
                child: Text(
                  "+ Add first course",
                  style: TextStyle(fontFamily: "Inter", color: const Color(0xFF43991C)),
                ),
              )),
        ),
      ),
    );
  }

  Widget courseList(screenHeight, screenWidth) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.10),
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 15,
              );
            },
            itemCount: courses.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => _addCourse(courses[index]),
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
                  height: 50,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Center(
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 7),
                              child: Icon(
                                Icons.flag,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                              courses[index].name,
                              style: TextStyle(fontFamily: "Inter", color: Colors.black, fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 15),
                              child: Container(
                                width: 25.0,
                                height: 25.0,
                                decoration: BoxDecoration(
                                  color: selected == courses[index]
                                      ? const Color(0xFF43991C)
                                      : Colors.white,
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(50.0)),
                                  border: new Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Icon(
                                  Icons.check,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 80, top: 10),
          child: GestureDetector(
              onTap: () => _showAddCourse(context),
              child: Text(
                "+ Add more courses",
                style: TextStyle(fontFamily: "Inter", color: const Color(0xFF43991C)),
              )),
        ),
      ],
    );
  }

  Future<List<Course>> _getCourses() async {
    DatabaseHelper helper = DatabaseHelper.instance;
    return await helper.queryAllCourses();
  }

  _showAddCourse(BuildContext context) async {
    final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewCoursePage()));
    if(result != null){
      setState(() {
        courses.add(result);
      });
    }
  }

  _addCourse(Course course) {
    setState(() {
      selected = course;
    });
  }

  _choosePlayer(BuildContext context) {
    if(selected != null){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ChoosePlayerPage(course: selected,)));
    }
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }
}
