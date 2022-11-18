class StudentCardModel {
  int? id;
  String? name;
  String? state;
  String? city;

  StudentCardModel({this.id, this.name, this.state, this.city});

  StudentCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state'] = this.state;
    data['city'] = this.city;
    return data;
  }
}
