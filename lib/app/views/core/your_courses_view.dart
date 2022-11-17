import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  Future getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('idUser') != null) {
      idUser = prefs.getInt('idUser');
    } else {
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Color.fromARGB(255, 0, 177, 136),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
        child: FutureBuilder(
            future: controller.getStudentWithCourses(idUser),
            builder: (context, snapshot) {
              if (controller.state == StudentState.ERROR) {
                return AlertErrorComponent();
              } else if (controller.state == StudentState.SUCCESS) {
                return ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(padding: EdgeInsets.only(top: 10));
                  },
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                          '/details-course',
                          arguments: snapshot.data?[index].id),
                      child: CardOutlineBorder(
                        title: snapshot.data?[index].nameCourse,
                        subtitle: snapshot.data?[index].nameUnversity,
                        sizeTitle: 20,
                        sizeSubtitle: 20,
                      ),
                    );
                  },
                );
              } else {
                return LoadingComponent();
              }
            }),
      ),
    );
  }
}
