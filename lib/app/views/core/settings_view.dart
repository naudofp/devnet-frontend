import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quickalert/quickalert.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/views/components/copyirght_component.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  StudentController controller = StudentController();
  int? idUser;

  Future getId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idUser = prefs.getInt('idUser');
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: AppController.instance.isDark ? Colors.white : Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 70,
                  child: Text(
                    'General',
                    textAlign: TextAlign.end,
                  )),
              Container(
                  child: Column(children: <Widget>[
                _option(
                  title: 'Edit Profile',
                  function: () {
                    print('logout');
                  },
                  backgroundColorButton: Colors.green,
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                _option(
                  title: 'Logout',
                  function: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.of(context).pushReplacementNamed('/');
                  },
                  backgroundColorButton: Colors.blueAccent,
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                _option(
                    function: () {
                      QuickAlert.show(
                          context: context,
                          type: QuickAlertType.warning,
                          title: 'Are you sure?',
                          cancelBtnText: 'Cancel',
                          confirmBtnText: "Yes, I'm sure",
                          showCancelBtn: true,
                          onConfirmBtnTap: () async {
                            await controller.deleteUser(idUser);

                            if (controller.state == StudentState.SUCCESS) {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.clear();
                              Navigator.of(context).pushReplacementNamed('/');

                              final snackBar = SnackBar(
                                duration: Duration(seconds: 3),
                                content: Row(
                                  children: [
                                    Icon(
                                      controller.message!['status'] == 200
                                          ? Icons.check
                                          : Icons.clear,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      controller.message!['message'],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                                backgroundColor:
                                    controller.message!['status'] == 200
                                        ? Color.fromARGB(255, 103, 180, 15)
                                        : Colors.red,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          });
                    },
                    title: 'Delete Account',
                    backgroundColorButton: Colors.orange,
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ))
              ])),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: 80,
                  height: 30,
                  child: Text(
                    'FeedBack',
                    textAlign: TextAlign.end,
                  )),
              Container(
                  child: Column(children: <Widget>[
                _option(
                  title: 'Send Feed',
                  function: () {
                    print('logout');
                  },
                  backgroundColorButton: Colors.grey,
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
                _option(
                    function: () {
                      print('remove');
                    },
                    title: 'Profile Author',
                    backgroundColorButton: Colors.grey,
                    icon: Icon(
                      Icons.person_pin,
                      color: Colors.white,
                    )),
                CopyrightComponent()
              ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _option(
      {required Function() function,
      required String title,
      required Icon icon,
      required Color backgroundColorButton}) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
        child: Container(
          width: 500,
          height: 55,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                child: icon,
                decoration: BoxDecoration(
                    color: backgroundColorButton,
                    borderRadius: BorderRadius.circular(50)),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
