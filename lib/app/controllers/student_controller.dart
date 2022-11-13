import 'package:schooltech/app/models/course/course_card_model.dart';
import 'package:schooltech/app/models/student/student_home.dart';
import 'package:schooltech/app/services/student_service.dart';

class StudentController {
  StudentService service = StudentService();
  StudentState state = StudentState.START;

  StudentHomeModel studentHome = StudentHomeModel();
  Future getStudentHome(int? id) async {
    state = StudentState.LOADING;

    try {
      studentHome = await service.getStudentHome(id);
      state = StudentState.SUCCESS;
    } catch (e) {
      state = StudentState.ERROR;
    }
  }

  List<CourseCardModel> studentWithCourses = [];
  Future getStudentWithCourses(int? id) async {
    state = StudentState.LOADING;

    try {
      studentWithCourses = await service.getStudentWithCourses(id);
    } catch (e) {
      state = StudentState.ERROR;
    }
  }
}

enum StudentState { START, LOADING, SUCCESS, ERROR }
