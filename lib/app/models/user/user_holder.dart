import 'dart:ffi';

class UserHolder {
  int? id;
  String? role;

  UserHolder({this.id, this.role});

  UserHolder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    return data;
  }
}
