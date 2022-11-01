import 'package:flutter/material.dart';
import 'package:schooltech/app_controller.dart';
import 'package:schooltech/login/login_page.dart';
import 'package:schooltech/student/home_student.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
              primaryColor: Colors.deepPurpleAccent,
              brightness: AppController.instance.isDark
                  ? Brightness.dark
                  : Brightness.light),
          routes: {
            '/': (context) => LoginPage(),
            '/home-student': (context) => HomeStudent()
          },
        );
      },
    );
  }
}
