import 'package:flutter/material.dart';
import 'package:schooltech/app/components/switch_theme.dart';
import 'package:schooltech/app/view/core/your_courses_view.dart';
import 'package:schooltech/app/view/student/home_page_view.dart';
import 'package:schooltech/app/view/student/universityStudent/your_university_view.dart';

class HomeStudent extends StatefulWidget {
  @override
  State<HomeStudent> createState() {
    return HomeStudentState();
  }
}

class HomeStudentState extends State<HomeStudent> {
  static HomeStudent instance = HomeStudent();
  int currentOption = 1;

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
        drawer: MenuBurguer(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 0, 177, 136),
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
}

class MenuBurguer extends StatelessWidget {
  const MenuBurguer({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
