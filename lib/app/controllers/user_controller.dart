import 'package:schooltech/app/models/user/UserLogin.dart';
import 'package:schooltech/app/models/user/user_holder.dart';
import 'package:schooltech/app/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController {
  final UserService service = UserService();
  UserState state = UserState.START;
  UserHolder holder = UserHolder();

  setHolder(UserHolder user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt('idUser', user.id as int);
    prefs.setString('role', user.role as String);
  }

  Future login(UserLogin userlogin) async {
    state = UserState.LOADING;

    try {
      holder = await service.login(userlogin);
      state = UserState.SUCCESS;
    } catch (e) {
      state = UserState.ERROR;
    }
  }
}

enum UserState { START, LOADING, SUCCESS, ERROR }
