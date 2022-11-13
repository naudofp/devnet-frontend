import 'package:dio/dio.dart';
import 'package:schooltech/app/models/course/card_details_mode.dart';
import 'package:schooltech/app/models/course/course_card_model.dart';

class CourseService {
  String baseUrl = 'http://localhost:8080/course/';
  Dio dio = Dio();

  //  GET  COURSE-DETAILS //
  Future<CourseDetailsModel> getCourse(int? id) async {
    String url = baseUrl + id.toString();
    Response response = await dio.get(url);
    CourseDetailsModel data = CourseDetailsModel.fromJson(response.data);

    return data;
  }
}
