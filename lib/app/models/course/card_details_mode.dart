class CourseDetailsModel {
  int? id;
  String? nameCourse;
  int? scoreCourse;
  List<String>? developers;

  CourseDetailsModel(
      {this.id, this.nameCourse, this.scoreCourse, this.developers});

  CourseDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCourse = json['nameCourse'];
    scoreCourse = json['scoreCourse'];
    developers = json['developers'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameCourse'] = this.nameCourse;
    data['scoreCourse'] = this.scoreCourse;
    data['developers'] = this.developers;
    return data;
  }
}
