import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/models/course/course_card_model.dart';
import 'package:schooltech/app/views/components/alert_error.dart';
import 'package:schooltech/app/views/components/card_outline_border.dart';
import 'package:schooltech/app/views/components/loading_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourCourses extends StatefulWidget {
  YourCourses({super.key});

  @override
  State<YourCourses> createState() => _YourCoursesState();
}

class _YourCoursesState extends State<YourCourses> {
  int? idUser;
  final controller = StudentController();

  Future<List<CourseCardModel>> getStudentWithCourses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('idUser') != null) {
      idUser = prefs.getInt('idUser');
      return controller.getStudentWithCourses(idUser);
    } else {
      return controller.getStudentWithCourses(idUser);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getStudentWithCourses(),
          builder: (context, snapshot) {
            if (controller.state == StudentState.ERROR) {
              return AlertErrorComponent();
            } else if (controller.state == StudentState.SUCCESS) {
              return ListView.builder(
                padding: EdgeInsets.only(top: 10, left: 25, right: 25),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return CardOutlineBorder(
                    title: snapshot.data?[index].nameCourse,
                    subtitle: snapshot.data?[index].nameUnversity,
                    sizeTitle: 20,
                    sizeSubtitle: 20,
                    route: "/details-course",
                    idParam: snapshot.data?[index].id,
                  );
                },
              );
            } else {
              return LoadingComponent();
            }
          }),
    );
  }
}
