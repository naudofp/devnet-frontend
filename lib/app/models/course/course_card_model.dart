class CourseCardModel {
  int? id;
  String? nameCourse;
  String? nameUnversity;

  CourseCardModel({this.id, this.nameCourse, this.nameUnversity});

  CourseCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCourse = json['nameCourse'];
    nameUnversity = json['nameUnversity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameCourse'] = this.nameCourse;
    data['nameUnversity'] = this.nameUnversity;
    return data;
  }
}
