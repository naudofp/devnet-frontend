import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDark = false;

  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
