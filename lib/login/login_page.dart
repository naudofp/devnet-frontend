import 'package:custom_signin_buttons/custom_signin_buttons.dart';
import 'package:flutter/material.dart';
import 'package:schooltech/app_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  String email = "";
  String password = "";

  Widget _body() {
    return SingleChildScrollView(
        child: Container(
            width: 700,
            height: 800,
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(28.0),
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
                                TextField(
                                  onChanged: (text) {
                                    email = text;
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                ),
                                SizedBox(height: 20),
                                TextField(
                                    onChanged: (text) {
                                      password = text;
                                    },
                                    obscureText: true,
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
                            onPressed: () => {
                              //if (email != "" && password != "")
                              //{
                              Navigator.of(context)
                                  .pushReplacementNamed('/home')
                              //}
                            },
                            child: Text('Sign in'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 0, 177, 136),
                                minimumSize: Size(510, 55),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                          Padding(padding: EdgeInsets.all(25)),
                          SignInButton(
                            button: Button.Facebook,
                            width: 510,
                            height: 47,
                            borderRadius: 15,
                          ),
                          Padding(padding: EdgeInsets.all(7)),
                          SignInButton(
                            button: Button.LinkedIn,
                            width: 510,
                            height: 47,
                            borderRadius: 15,
                          ),
                          Padding(padding: EdgeInsets.all(7)),
                          SignInButton(
                            button: Button.GoogleBlack,
                            width: 510,
                            height: 47,
                            borderRadius: 15,
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
                                        color:
                                            Color.fromARGB(255, 0, 177, 136)),
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
