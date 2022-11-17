import 'package:schooltech/app/models/course/course_card_model.dart';
import 'package:schooltech/app/models/student/student_home.dart';
import 'package:schooltech/app/models/user/user_holder.dart';
import 'package:schooltech/app/services/student_service.dart';

class StudentController {
  StudentService service = StudentService();
  StudentState state = StudentState.START;

  UserHolder holder = UserHolder();
  Future<UserHolder> postStudent(body) async {
    state = StudentState.LOADING;

    try {
      state = StudentState.SUCCESS;
      holder = await service.postStudent(body);
    } catch (e) {
      state = StudentState.ERROR;
    } finally {
      return holder;
    }
  }

  StudentHomeModel studentHome = StudentHomeModel();
  Future<StudentHomeModel> getStudentHome(int? id) async {
    state = StudentState.LOADING;

    try {
      state = StudentState.SUCCESS;
      studentHome = await service.getStudentHome(id);
    } catch (e) {
      state = StudentState.ERROR;
    } finally {
      return studentHome;
    }
  }

  List<CourseCardModel> studentWithCourses = [];
  Future<List<CourseCardModel>> getStudentWithCourses(int? id) async {
    state = StudentState.LOADING;

    try {
      studentWithCourses = await service.getStudentWithCourses(id);
      state = StudentState.SUCCESS;
    } catch (e) {
      state = StudentState.ERROR;
    } finally {
      return studentWithCourses;
    }
  }
}

enum StudentState { START, LOADING, SUCCESS, ERROR }
