import 'package:dio/dio.dart';
import 'package:schooltech/app/models/course/course_card_model.dart';
import 'package:schooltech/app/models/student/student_card.dart';
import 'package:schooltech/app/models/student/student_home.dart';
import 'package:schooltech/app/models/student/student_register.dart';
import 'package:schooltech/app/models/user/user_holder.dart';

class StudentService {
  String baseUrl = 'http://localhost:8080/student/';
  Dio dio = Dio();

  // POST  STUDENT-REGISTER //
  Future<UserHolder> postStudent(newStudent) async {
    Response response = await dio.post(baseUrl, data: newStudent);
    print(response.statusMessage);
    UserHolder data = UserHolder.fromJson(response.data);

    return data;
  }

  // POST  STUDENT-ADD-COURSE  //
  Future<String> addCourseOnStudent(idStudent, idCourse) async {
    String url = baseUrl + '/add-course/' + idCourse + '/' + idStudent;
    Response response = await dio.post(url);
    String message = response.data;

    return message;
  }

  //  GET   STUDENT-HOME //
  Future<StudentHomeModel> getStudentHome(int? id) async {
    String url = baseUrl + id.toString();
    Response response = await dio.get(url);
    StudentHomeModel data = StudentHomeModel.fromJson(response.data);

    return data;
  }

  //  GET  STUDENT-WITH-COURSES   //
  Future<List<CourseCardModel>> getStudentWithCourses(int? id) async {
    String url = baseUrl + 'courses/' + id.toString();
    Response response = await dio.get(url);

    final courses = response.data as List;
    return courses.map((json) => CourseCardModel.fromJson(json)).toList();
  }

  //  GET  STUDENT-BY-NAME   //
  Future<List<StudentCardModel>> getStudentByName(name) async {
    String url = baseUrl + 'name/' + name;
    Response response = await dio.get(url);

    final students = response.data as List;
    return students.map((json) => StudentCardModel.fromJson(json)).toList();
  }
}
