import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/views/components/switch_theme.dart';
import 'package:schooltech/app/views/student/courses/your_courses_view.dart';
import 'package:schooltech/app/views/student/friends/friends_list_view.dart';
import 'package:schooltech/app/views/student/home_page_view.dart';
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
                icon: Icon(Icons.group_add), label: 'Friends'),
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
          children: [FriendsListView(), HomePageStudentView(), YourCourses()],
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
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.logout_sharp,
              color: Colors.red,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
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
