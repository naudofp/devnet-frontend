import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/user_controller.dart';
import 'package:schooltech/app/models/user/UserLogin.dart';
import 'package:schooltech/app/models/user/user_holder.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
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
              child: Form(
                key: formKey,
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 10, bottom: 0, right: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Text('Welcome',
                                    style: TextStyle(fontSize: 38))),
                            SizedBox(height: 50),
                            Container(
                              width: 500,
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (email) {
                                      if (email == null || email.isEmpty) {
                                        return 'Please, typing something';
                                      } else if (!RegExp(
                                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(emailController.text)) {
                                        return "Invalid email";
                                      }
                                    },
                                    onChanged: (value) {
                                      userLogin.email = value;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Email',
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15))),
                                  ),
                                  SizedBox(height: 20),
                                  TextFormField(
                                      controller: passwordController,
                                      keyboardType: TextInputType.text,
                                      validator: (senha) {
                                        if (senha == null || senha.isEmpty) {
                                          return "Please, typing something";
                                        }
                                        return null;
                                      },
                                      obscureText: true,
                                      onChanged: (value) {
                                        userLogin.password = value;
                                      },
                                      decoration: InputDecoration(
                                          labelText: 'Password',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)))),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                await controller.login(userLogin);
                                UserHolder holder = controller.holder;

                                if (holder.role == 'STUDENT_USER') {
                                  controller.setHolder(holder);
                                  Navigator.of(context)
                                      .pushReplacementNamed('/home-student');
                                } else if (holder.role == 'UNIVERSITY_USER') {
                                  Navigator.of(context)
                                      .pushNamed('/details-course');
                                }
                              },
                              onLongPress: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/home-student');
                              },
                              child: Text('Sign in'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromARGB(255, 0, 177, 136),
                                  minimumSize: Size(510, 55),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                                alignment: Alignment.bottomCenter,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Sign up',
                                      style: TextStyle(
                                          fontFamily: 'Sono',
                                          color:
                                              Color.fromARGB(255, 0, 177, 136)),
                                    )))
                          ]),
                    )),
              ),
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
          child: Image.asset(
            'assets/images/background_login.jpg',
            fit: BoxFit.cover,
          ),
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
