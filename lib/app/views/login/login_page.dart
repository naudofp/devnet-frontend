import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/user_controller.dart';
import 'package:schooltech/app/models/user/UserLogin.dart';
import 'package:schooltech/app/models/user/user_holder.dart';
import 'package:schooltech/app/views/components/loading_component.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  UserController controller = UserController();
  UserLogin userLogin = UserLogin('', '');

  Widget _body() {
    return SingleChildScrollView(
        child: Container(
            width: 700,
            height: 480,
            alignment: Alignment.center,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 25, left: 10, right: 10, bottom: 25),
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, left: 10, bottom: 0, right: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          alignment: Alignment.center,
                          child: Text('Welcome',
                              style: TextStyle(
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                        color: Color.fromARGB(255, 0, 177, 136),
                                        blurRadius: 15)
                                  ],
                                  fontSize: 38,
                                  fontFamily: 'Sono'))),
                      SizedBox(height: 50),
                      Container(
                        width: 500,
                        child: Column(
                          children: [
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                userLogin.username = value;
                              },
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              105, 158, 158, 158),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 177, 136),
                                          width: 2)),
                                  labelText: 'Username',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                            SizedBox(height: 20),
                            TextField(
                                style: TextStyle(color: Colors.white),
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                onChanged: (value) {
                                  userLogin.password = value;
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color: Color.fromARGB(
                                              105, 158, 158, 158),
                                          width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 177, 136),
                                          width: 2)),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          await controller.login(userLogin);

                          if (controller.state == UserState.SUCCESS) {
                            UserHolder holder = controller.holder;

                            controller.setHolder(holder);
                            Navigator.of(context)
                                .pushReplacementNamed('/home-student');
                          } else if (controller.state == UserState.ERROR) {
                            QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: 'Something be wrong',
                                confirmBtnText: 'Try Again',
                                confirmBtnColor: Colors.grey);
                          } else {
                            LoadingComponent();
                          }
                        },
                        onLongPress: () {
                          Navigator.of(context)
                              .pushReplacementNamed('/home-student');
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            minimumSize: Size(510, 55),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 2,
                                    color: Color.fromARGB(255, 0, 177, 136)),
                                borderRadius: BorderRadius.circular(15))),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/register');
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 0, 177, 136)),
                              )))
                    ]),
              )),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
        ),
        _body(),
      ],
    ));
  }
}

class SwitchTheme extends StatelessWidget {
  const SwitchTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      activeColor: Colors.black38,
      value: AppController.instance.isDark,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
