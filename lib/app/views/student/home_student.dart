import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/views/components/switch_theme.dart';
import 'package:schooltech/app/views/core/your_courses_view.dart';
import 'package:schooltech/app/views/student/home_page_view.dart';
import 'package:schooltech/app/views/student/universityStudent/your_university_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeStudent extends StatefulWidget {
  @override
  State<HomeStudent> createState() {
    return HomeStudentState();
  }
}

class HomeStudentState extends State<HomeStudent> {
  static HomeStudent instance = HomeStudent();
  int currentOption = 1;
  int? idUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentOption,
          onTap: (value) {
            setState(() {
              currentOption = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.school), label: 'Your University'),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book), label: 'Your Courses'),
          ],
        ),
        drawer: _menuBurguer(),
        appBar: AppBar(
          backgroundColor: AppController.instance.isDark
              ? Colors.black87
              : const Color.fromARGB(255, 0, 177, 136),
          title: const Text(
            'SchoolTech',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          actions: [SwitchThemeButton()],
        ),
        body: IndexedStack(
          index: currentOption,
          children: [YourUniversity(), HomePageStudentView(), YourCourses()],
        ));
  }

  Widget _menuBurguer() {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.black87),
              accountName: Text('Fellipe'),
              accountEmail: Text('felipenaudof@gmail.com')),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Your University'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Your courses'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout_sharp),
            title: Text('Logout'),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
