import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/course_controller.dart';
import 'package:schooltech/app/models/course/course_holder.dart';
import 'package:schooltech/app/views/components/alert_error.dart';
import 'package:schooltech/app/views/components/card_outline_border.dart';
import 'package:schooltech/app/views/components/loading_component.dart';

class SearchCourse extends SearchDelegate<String> {
  CourseController controller = CourseController();

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
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
        child: FutureBuilder(
          future: controller.getAllCouses(),
          builder: (context, snapshot) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              scrollDirection: Axis.vertical,
              itemCount: controller.courses.length,
              itemBuilder: (context, index) {
                if (controller.state == CourseState.SUCCESS) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                        '/details-course',
                        arguments:
                            CourseHolder(snapshot.data![index].id, false)),
                    child: CardOutlineBorder(
                      title: snapshot.data![index].nameCourse,
                      subtitle: snapshot.data![index].score.toString(),
                      sizeTitle: 20,
                      sizeSubtitle: 20,
                    ),
                  );
                } else if (controller.state == CourseState.ERROR) {
                  return AlertErrorComponent();
                } else {
                  return LoadingComponent();
                }
              },
            );
          },
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 20),
        child: FutureBuilder(
          future: controller.getCouseByName(query),
          builder: (context, snapshot) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 10,
                );
              },
              itemCount: controller.courses.length,
              itemBuilder: (context, index) {
                if (controller.state == CourseState.SUCCESS) {
                  return InkWell(
                    onTap: () => Navigator.of(context).pushNamed(
                        '/details-course',
                        arguments:
                            CourseHolder(snapshot.data![index].id, false)),
                    child: CardOutlineBorder(
                      title: snapshot.data![index].nameCourse,
                      subtitle: snapshot.data![index].score.toString(),
                      sizeTitle: 20,
                      sizeSubtitle: 20,
                    ),
                  );
                } else if (controller.state == CourseState.ERROR) {
                  return AlertErrorComponent();
                } else {
                  return LoadingComponent();
                }
              },
            );
          },
        ),
      );
    }
  }
}
