class StudentHomeModel {
  int? id;
  String? name;
  String? username;
  int? score;

  StudentHomeModel({this.id, this.name, this.username, this.score});

  factory StudentHomeModel.fromJson(Map<String, dynamic> json) {
    return StudentHomeModel(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        score: json['score']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['score'] = this.score;
    return data;
  }
}
