import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/models/course/course_card_model.dart';
import 'package:schooltech/app/views/components/card_outline_border.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourCourses extends StatefulWidget {
  YourCourses({super.key});

  @override
  State<YourCourses> createState() => _YourCoursesState();
}

class _YourCoursesState extends State<YourCourses> {
  int? idUser;
  final controller = StudentController();
  List<CourseCardModel> courses = [];

  @override
  void initState() {
    super.initState();
    getStudentWithCourses();
  }

  Future getStudentWithCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('idUser') != null) {
      idUser = prefs.getInt('idUser');
      await controller.getStudentWithCourses(idUser);
      courses = controller.studentWithCourses;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.only(top: 10, left: 25, right: 25),
        scrollDirection: Axis.vertical,
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return CardOutlineBorder(
            title: courses[index].nameCourse ?? '',
            subtitle: 'Alura',
            sizeTitle: 20,
            sizeSubtitle: 20,
            route: "/details-course",
          );
        },
      ),
    );
  }
}



          /*    SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
          child: Column(
            children: [
              Center(
                  child: Text(
                'Your Courses',
                style: TextStyle(fontSize: 30),
              )),
              SizedBox(height: 50),
              
            ],
          ),
        ),
      ),*/