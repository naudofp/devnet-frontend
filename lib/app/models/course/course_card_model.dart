class CourseCardModel {
  int? id;
  String? nameCourse;
  int? score;

  CourseCardModel({this.id, this.nameCourse, this.score});

  CourseCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCourse = json['nameCourse'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameCourse'] = this.nameCourse;
    data['score'] = this.score;
    return data;
  }
}
