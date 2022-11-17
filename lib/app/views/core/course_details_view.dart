import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/course_controller.dart';
import 'package:schooltech/app/models/course/card_details_mode.dart';
import 'package:schooltech/app/views/components/loading_component.dart';
import 'package:schooltech/app/views/components/switch_theme.dart';
import 'package:schooltech/app/controllers/app_controller.dart';

class CourseDetails extends StatefulWidget {
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  CourseController controller = CourseController();

  Future<CourseDetailsModel> getCourseDetails(id) async {
    return await controller.getCouseDetails(id);
  }

  Widget build(BuildContext context) {
    final idCourse = ModalRoute.of(context)!.settings.arguments as int?;

    return Scaffold(
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
                      Text('${snapshot.data?.nameUniversity}',
                          style: TextStyle(fontSize: 18)),
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
                      Container(
                        width: 500,
                        height: 500,
                        child: Column(
                          children: [
                            Text(
                              'Some Students',
                              style: TextStyle(fontSize: 35),
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 402,
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Fellipe',
                                            style: TextStyle(
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text('Blumenau',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500)),
                                        ],
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppController.instance.isDark
                                            ? Colors.transparent
                                            : Colors.white,
                                        border: Border.all(
                                          width: 3,
                                          color: AppController.instance.isDark
                                              ? Colors.white
                                              : const Color.fromARGB(
                                                  255, 0, 177, 136),
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
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
