import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/models/student/student_home.dart';
import 'package:schooltech/app/views/components/copyirght_component.dart';
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
  final controller = StudentController();

  int currentOption = 1;
  int? idUser;

  Future<StudentHomeModel> getStudentHome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    idUser = prefs.getInt("idUser");
    return await controller.getStudentHome(idUser);
  }

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
            'DevNet',
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
      child: FutureBuilder(
          future: getStudentHome(),
          builder: (context, snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.black87),
                        accountName: Text(snapshot.data?.name ?? ''),
                        accountEmail: Text(snapshot.data?.username ?? '')),
                    ListTile(
                      leading: Icon(Icons.settings),
                      title: Text('Settings'),
                      onTap: () {
                        Navigator.of(context).pushNamed('/settings');
                      },
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
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.clear();
                        Navigator.of(context).pushReplacementNamed('/');
                      },
                    ),
                  ],
                ),
                CopyrightComponent()
              ],
            );
          }),
    );
  }
}
