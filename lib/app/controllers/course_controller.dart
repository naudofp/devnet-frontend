import 'package:schooltech/app/models/course/card_details_mode.dart';
import 'package:schooltech/app/services/course_service.dart';

class CourseController {
  CourseService service = CourseService();
  CourseState state = CourseState.START;

  CourseDetailsModel course = CourseDetailsModel();
  Future<CourseDetailsModel> getCouseDetails(int? id) async {
    state = CourseState.LOADING;

    try {
      course = await service.getCourse(id);
      state = CourseState.SUCCESS;
    } catch (e) {
      state = CourseState.ERROR;
    } finally {
      return course;
    }
  }
}

enum CourseState { START, LOADING, SUCCESS, ERROR }
