import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/models/student/student_home.dart';
import 'package:schooltech/app/views/components/card_home_student.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/views/components/loading_component.dart';
import 'package:schooltech/app/views/core/search/search_course_view.dart';
import 'package:schooltech/app/views/core/search/search_students_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageStudentView extends StatelessWidget {
  HomePageStudentView({super.key}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
            child: Column(
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      'assets/images/avatar_male.png',
                      width: 200,
                      height: 200,
                    )),
                SizedBox(
                  height: 30,
                ),
                CardScore(),
                CardHomeStudent(
                  text: 'Search \n Courses',
                  search: SearchCourse(),
                ),
                CardHomeStudent(
                  text: 'Search \n Students',
                  search: SearchStudents(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardScore extends StatefulWidget {
  int? idUser;

  CardScore({super.key, this.idUser});

  @override
  State<CardScore> createState() => _CardScoreState();
}

class _CardScoreState extends State<CardScore> {
  int? idUser;
  final controller = StudentController();

  @override
  void initState() {
    super.initState();
    getStudentHome();
  }

  Future<StudentHomeModel> getStudentHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    idUser = prefs.getInt("idUser");
    return await controller.getStudentHome(idUser);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStudentHome(),
        builder: (context, snapshot) {
          return Container(
            width: 600,
            height: 125,
            decoration: BoxDecoration(
                border: Border.all(
                    color: AppController.instance.isDark
                        ? Color.fromARGB(255, 117, 117, 117)
                        : const Color.fromARGB(255, 0, 177, 136),
                    width: 7)),
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: snapshot.data?.name == null
                    ? LoadingComponent()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                snapshot.data!.name ?? '',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Score: ',
                                  style: TextStyle(
                                      fontSize: 29,
                                      fontWeight: FontWeight.w400)),
                            ],
                          ),
                          Text(snapshot.data!.score.toString(),
                              style: TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: AppController.instance.isDark
                                      ? Color.fromARGB(255, 49, 255, 56)
                                      : Color.fromARGB(255, 1, 157, 6))),
                        ],
                      )),
          );
        });
  }
}
