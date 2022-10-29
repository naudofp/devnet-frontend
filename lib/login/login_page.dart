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
  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    return Scaffold(
      body: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.all(40.0)),
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
                            Navigator.of(context).pushReplacementNamed('/home')
                            //}
                          },
                          child: Text('Sign in'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 177, 136),
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
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 177, 136)),
                                )))
                      ])))),
    );
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
