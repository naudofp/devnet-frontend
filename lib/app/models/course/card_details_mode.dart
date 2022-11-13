class CourseDetailsModel {
  int? id;
  String? nameCourse;
  String? nameUniversity;
  int? scoreCourse;
  List<String>? nameStudents;

  CourseDetailsModel(
      {this.id,
      this.nameCourse,
      this.nameUniversity,
      this.scoreCourse,
      this.nameStudents});

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCourse = json['nameCourse'];
    nameUniversity = json['nameUniversity'];
    scoreCourse = json['scoreCourse'];
    nameStudents = json['nameStudents'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameCourse'] = this.nameCourse;
    data['nameUniversity'] = this.nameUniversity;
    data['scoreCourse'] = this.scoreCourse;
    data['nameStudents'] = this.nameStudents;
    return data;
  }
}
