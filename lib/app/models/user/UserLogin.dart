class UserLogin {
  String username;
  String password;

  UserLogin(this.username, this.password);

  factory UserLogin.fromJson(Map json) {
    return UserLogin(json['username'], json['password']);
  }

  Map toJson() {
    return {'username': username, 'password': password};
  }
}
