class StudentRegisterModel {
  String? name;
  String? street;
  String? city;
  String? country;
  String? state;
  int? number;
  String? email;
  String? password;

  StudentRegisterModel(
      {this.name,
      this.street,
      this.city,
      this.country,
      this.state,
      this.number,
      this.email,
      this.password});

  StudentRegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    street = json['street'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    number = json['number'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['street'] = this.street;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['number'] = this.number;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
