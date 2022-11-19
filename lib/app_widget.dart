import 'package:flutter/material.dart';
import 'package:schooltech/app/views/core/course_details_view.dart';
import 'package:schooltech/app/views/login/welcome_page.dart';
import 'package:schooltech/app/views/register/register_student.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/views/login/login_page.dart';
import 'package:schooltech/app/views/student/home_student.dart';

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
                : Brightness.light,
          ),
          routes: {
            '/': (context) => WelcomePage(),
            '/login': (context) => LoginPage(),
            '/register': (context) => RegisterStudent(),
            '/home-student': (context) => HomeStudent(),
            '/details-course': (context) => CourseDetails(),
          },
        );
      },
    );
  }
}
