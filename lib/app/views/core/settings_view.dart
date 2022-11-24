import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/views/components/copyirght_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        title: Text('Settings'),
        iconTheme: IconThemeData(
            color: AppController.instance.isDark ? Colors.white : Colors.black),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                _general(),
                _feedback(),
                _github(),
                CopyrightComponent()
              ])),
        ),
      ),
    );
  }

  Widget _general() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
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
              SharedPreferences prefs = await SharedPreferences.getInstance();
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
                          backgroundColor: controller.message!['status'] == 200
                              ? Color.fromARGB(255, 103, 180, 15)
                              : Colors.red,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
      ],
    );
  }

  Widget _feedback() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
            title: 'Send FeedBack',
            function: () {
              launchUrlString(
                  "https://wa.me/554797742630?text=Visitei%20seu%20projeto%20DevNet,%20Parabéns!!");
            },
            backgroundColorButton: Colors.black,
            icon: Icon(
              Icons.whatsapp,
              color: Colors.white,
            ),
          ),
          _option(
              function: () {
                launchUrlString(
                    'https://www.linkedin.com/in/naudo-fellipe-3b19a7194/');
              },
              title: 'Profile Author',
              backgroundColorButton: Colors.black,
              icon: Icon(
                Icons.person_pin,
                color: Colors.white,
              )),
        ])),
      ],
    );
  }

  Widget _github() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        SizedBox(
            width: 80,
            height: 30,
            child: Text(
              'GitHub',
              textAlign: TextAlign.end,
            )),
        Container(
            child: Column(children: <Widget>[
          _option(
            title: 'Back-end',
            function: () {
              launch("https://github.com/naudofp/devnet-backend");
            },
            backgroundColorButton: Colors.purple,
            icon: Icon(
              FontAwesomeIcons.github,
              color: Colors.white,
            ),
          ),
          _option(
            title: 'Front-end',
            function: () {
              launch("https://github.com/naudofp/devnet-frontend");
            },
            backgroundColorButton: Colors.purple,
            icon: Icon(
              FontAwesomeIcons.github,
              color: Colors.white,
            ),
          )
        ])),
      ],
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
