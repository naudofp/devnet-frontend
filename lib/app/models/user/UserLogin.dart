class UserLogin {
  String email;
  String password;

  UserLogin(this.email, this.password);

  factory UserLogin.fromJson(Map json) {
    return UserLogin(json['email'], json['password']);
  }

  Map toJson() {
    return {'email': email, 'password': password};
  }
}
