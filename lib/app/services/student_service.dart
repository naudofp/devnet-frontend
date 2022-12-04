import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:schooltech/app/models/course/course_card_model.dart';
import 'package:schooltech/app/models/student/student_card.dart';
import 'package:schooltech/app/models/student/student_home.dart';
import 'package:schooltech/app/models/user/user_holder.dart';

class StudentService {
  String baseUrl = 'http://localhost:5114/api/developer/';
  Dio dio = Dio();

  // POST  STUDENT-REGISTER //
  Future<UserHolder> postStudent(newStudent) async {
    Response response = await dio.post(baseUrl, data: newStudent);
    UserHolder data = UserHolder.fromJson(response.data);

    return data;
  }

  // POST  STUDENT-ADD-COURSE  //
  Future<Map?> addCourseOnStudent(idStudent, idCourse) async {
    Uri url = Uri.http(
        'localhost:5114', '/api/developer/add-course/$idCourse/$idStudent');
    final response = await http.post(url);

    if (response.statusCode == 200) {
      return {"message": response.body, "status": response.statusCode};
    } else if (response.statusCode == 500) {
      return jsonDecode(response.body);
    }
  }

  // DELETE  STUDENT-REMOVE-COURSE  //
  Future<Map?> removeCourseOnStudent(idStudent, idCourse) async {
    Uri url = Uri.https(
        'localhost:5114', '/api/developer/remove-course/$idCourse/$idStudent');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      return {"message": response.body, "status": response.statusCode};
    } else if (response.statusCode == 500) {
      return jsonDecode(response.body);
    }
  }

  // DELETE  STUDENT  //
  Future<Map?> deleteUser(idUser) async {
    Uri url = Uri.https('localhost:5114', '/api/developer/$idUser');
    final response = await http.delete(url);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return {"message": response.body, "status": response.statusCode};
    } else if (response.statusCode == 500) {
      return jsonDecode(response.body);
    }
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
