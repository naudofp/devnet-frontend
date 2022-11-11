import 'package:dio/dio.dart';
import 'package:schooltech/app/models/student/student_home.dart';

class StudentService {
  String baseUrl = 'http://localhost:8080/student/';
  Dio dio = Dio();

  //  GET   STUDENT-HOME //
  Future<StudentHomeModel> getStudentHome(int? id) async {
    String url = baseUrl + id.toString();
    Response response = await dio.get(url);
    StudentHomeModel data = StudentHomeModel.fromJson(response.data);

    return data;
  }
}
