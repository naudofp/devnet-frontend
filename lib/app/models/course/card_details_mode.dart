class CourseDetailsModel {
  int? id;
  String? nameCourse;
  int? scoreCourse;
  List<String>? nameStudents;

  CourseDetailsModel(
      {this.id, this.nameCourse, this.scoreCourse, this.nameStudents});

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCourse = json['nameCourse'];
    scoreCourse = json['scoreCourse'];
    nameStudents = json['nameStudents'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameCourse'] = this.nameCourse;
    data['scoreCourse'] = this.scoreCourse;
    data['nameStudents'] = this.nameStudents;
    return data;
  }
}
