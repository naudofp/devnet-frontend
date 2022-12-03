import 'package:dio/dio.dart';
import 'package:schooltech/app/models/course/card_details_mode.dart';
import 'package:schooltech/app/models/course/course_card_model.dart';

class CourseService {
  String baseUrl = 'https://localhost:7268/api/course/';
  Dio dio = Dio();

  //  GET  COURSE-DETAILS //
  Future<CourseDetailsModel> getCourse(int? id) async {
    String url = baseUrl + id.toString();
    Response response = await dio.get(url);
    CourseDetailsModel data = CourseDetailsModel.fromJson(response.data);

    return data;
  }

  //  GET  COURSES  //
  Future<List<CourseCardModel>> getAllCourses() async {
    String url = baseUrl;
    Response response = await dio.get(url);
    final data = response.data as List;

    return data.map((course) => CourseCardModel.fromJson(course)).toList();
  }

  //  GET  COURSES-BY-NAME  //
  Future<List<CourseCardModel>> getCourseByName(query) async {
    String url = baseUrl + 'name/' + query;
    Response response = await dio.get(url);
    final data = response.data as List;

    return data.map((course) => CourseCardModel.fromJson(course)).toList();
  }
}
