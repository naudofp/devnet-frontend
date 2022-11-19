import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/course_controller.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/models/course/card_details_mode.dart';
import 'package:schooltech/app/views/components/loading_component.dart';
import 'package:schooltech/app/views/components/switch_theme.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetails extends StatefulWidget {
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  CourseController controller = CourseController();
  StudentController studentController = StudentController();
  int? idUser;
  Future<CourseDetailsModel> getCourseDetails(id) async {
    return await controller.getCouseDetails(id);
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

  Future getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idUser = prefs.getInt('idUser');
  }

  Widget build(BuildContext context) {
    final idCourse = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await studentController.addCourseOnStudent(idUser, idCourse);
            print(studentController.message);
          },
          child: Icon(Icons.add),
          backgroundColor: AppController.instance.isDark
              ? Colors.white
              : const Color.fromARGB(255, 0, 177, 136)),
      appBar: AppBar(
        backgroundColor: AppController.instance.isDark
            ? Colors.black87
            : const Color.fromARGB(255, 0, 177, 136),
        title: const Text(
          '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [SwitchThemeButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
          child: Center(
            child: FutureBuilder<CourseDetailsModel>(
              future: getCourseDetails(idCourse),
              builder: (context, snapshot) {
                if (controller.state == CourseState.SUCCESS) {
                  return Column(
                    children: [
                      Text(
                        snapshot.data?.nameCourse ?? '',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(padding: EdgeInsets.only(top: 60)),
                      Container(
                        width: 200,
                        height: 150,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 3.5,
                                color: AppController.instance.isDark
                                    ? Colors.white
                                    : Colors.black)),
                        child: Center(
                            child: Text(
                          '+${snapshot.data?.scoreCourse}',
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: AppController.instance.isDark
                                  ? Color.fromARGB(255, 49, 255, 56)
                                  : Color.fromARGB(255, 1, 157, 6)),
                        )),
                      ),
                      Padding(padding: EdgeInsets.only(top: 60)),
                    ],
                  );
                } else if (controller.state == CourseState.ERROR) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 275),
                    child: Center(
                      child: AlertDialog(
                        backgroundColor: Colors.red,
                        content: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 40,
                                width: 40,
                                child: Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Ops, something be wrong',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        actionsAlignment: MainAxisAlignment.center,
                        actions: [
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Text(
                              'Try Again',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic,
                                  decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      SizedBox(
                        height: 250,
                      ),
                      LoadingComponent(),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
