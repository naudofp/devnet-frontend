import 'package:schooltech/app/models/course/card_details_mode.dart';
import 'package:schooltech/app/models/course/course_card_model.dart';
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

  List<CourseCardModel> courses = [];
  Future<List<CourseCardModel>> getAllCouses() async {
    state = CourseState.LOADING;

    try {
      courses.clear();

      courses = await service.getAllCourses();
      state = CourseState.SUCCESS;
    } catch (e) {
      state = CourseState.ERROR;
    } finally {
      return courses;
    }
  }

  Future<List<CourseCardModel>> getCouseByName(query) async {
    state = CourseState.LOADING;

    try {
      courses.clear();
      courses = await service.getCourseByName(query);
      state = CourseState.SUCCESS;
    } catch (e) {
      state = CourseState.ERROR;
    } finally {
      return courses;
    }
  }
}

enum CourseState { START, LOADING, SUCCESS, ERROR }
