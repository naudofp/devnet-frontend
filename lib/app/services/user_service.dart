import 'package:dio/dio.dart';
import 'package:schooltech/app/models/user/UserLogin.dart';
import 'package:schooltech/app/models/user/user_holder.dart';

class UserService {
  final dio = Dio();
  final String url = 'http://localhost:5114/api/user/login';

//   POST   //

  Future<UserHolder> login(UserLogin userlogin) async {
    var body = userlogin;
    Response response = await dio.post(url, data: body);
    UserHolder holder = UserHolder.fromJson(response.data);

    return holder;
  }
}
