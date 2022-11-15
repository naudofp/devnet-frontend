import 'package:flutter/cupertino.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();

  bool isDark = false;

  setTheme(value) {
    isDark = value;
  }

  changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}
