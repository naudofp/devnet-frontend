import 'package:flutter/material.dart';
import 'package:schooltech/app/components/card_home_student.dart';
import 'package:schooltech/app/controller/app_controller.dart';
import 'package:schooltech/app/view/student/home_student.dart';

class HomePageStudentView extends StatelessWidget {
  const HomePageStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
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
              CardScore(),
              CardHomeStudent(
                text: 'Search \n Universitys',
                route: '/search-univeristys',
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

class CardScore extends StatelessWidget {
  const CardScore({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 125,
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(255, 0, 177, 136), width: 10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Fellipe Naudo',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Score: ',
                    style:
                        TextStyle(fontSize: 29, fontWeight: FontWeight.w400)),
              ],
            ),
            Text('150',
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: AppController.instance.isDark
                        ? Color.fromARGB(255, 49, 255, 56)
                        : Color.fromARGB(255, 1, 157, 6))),
          ],
        ),
      ),
    );
  }
}
