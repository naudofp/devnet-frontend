class StudentHomeModel {
  int? id;
  String? name;
  int? score;

  StudentHomeModel({this.id, this.name, this.score});

  factory StudentHomeModel.fromJson(Map<String, dynamic> json) {
    return StudentHomeModel(
        id: json['id'], name: json['name'], score: json['score']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    return data;
  }
}
