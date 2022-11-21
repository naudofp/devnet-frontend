import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/models/student/student_card.dart';
import 'package:schooltech/app/views/components/alert_error.dart';
import 'package:schooltech/app/views/components/card_outline_border.dart';
import 'package:schooltech/app/views/components/loading_component.dart';
import 'package:schooltech/app/views/student/home_page_view.dart';

class SearchStudents extends SearchDelegate<String> {
  StudentController controller = StudentController();
  int? idStudent;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: controller.getStudentHome(idStudent),
      builder: (context, snapshot) {
        if (controller.state == StudentState.SUCCESS) {
          return Padding(
            padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
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
                  height: 10,
                ),
                Text(
                  snapshot.data?.username ?? '',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
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
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
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
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: AppController.instance.isDark
                        ? Color.fromARGB(255, 117, 117, 117)
                        : const Color.fromARGB(255, 0, 177, 136),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.person_add),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          );
        } else if (controller.state == StudentState.ERROR) {
          return AlertErrorComponent();
        } else
          return LoadingComponent();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
      child: FutureBuilder(
        future: controller.getStudentByName(query),
        builder: (context, snapshot) {
          if (query.isNotEmpty) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                if (controller.state == StudentState.SUCCESS) {
                  return InkWell(
                    onTap: () {
                      idStudent = snapshot.data![index].id;
                      showResults(context);
                    },
                    child: CardOutlineBorder(
                      title: snapshot.data![index].username,
                      subtitle: snapshot.data![index].name,
                      sizeTitle: 20,
                      sizeSubtitle: 20,
                    ),
                  );
                } else if (controller.state == StudentState.ERROR) {
                  return AlertErrorComponent();
                } else {
                  return LoadingComponent();
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
