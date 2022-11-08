import 'package:flutter/material.dart';
import 'package:schooltech/app/components/card_home_student.dart';

class HomeStudentView extends StatelessWidget {
  const HomeStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 10),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    'assets/images/avatar_male.png',
                    width: 200,
                    height: 200,
                  )),
              SizedBox(
                height: 30,
              ),
              CardHomeStudent(
                text: 'Search \n Universitys',
                route: '/search-univeristys',
              ),
              SizedBox(
                height: 20,
              ),
              CardHomeStudent(
                text: 'Search \n Courses',
                route: '/search-courses',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
