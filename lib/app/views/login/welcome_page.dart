import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => __WelcomePageState();
}

class __WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
    findUser().then((value) {
      if (value != null) Navigator.of(context).pushReplacementNamed(value);
    });
  }

  Future<String?> findUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('idUser') != null) {
      return '/home-student';
    } else
      return null;
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          width: 250,
          height: 470,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.code_sharp,
                    size: 170,
                    shadows: [
                      Shadow(
                          color: Color.fromARGB(255, 0, 177, 136),
                          blurRadius: 20)
                    ],
                    color: Colors.white,
                  ),
                  Text(
                    'DEVNET',
                    style: TextStyle(
                        fontFamily: 'Sono',
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(255, 0, 177, 136),
                              blurRadius: 40)
                        ]),
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/login');
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        fixedSize: Size(220, 55),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 0, 177, 136),
                                width: 3),
                            borderRadius: BorderRadius.circular(22))),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 0, 0, 0),
                        fixedSize: Size(220, 55),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 0, 177, 136),
                                width: 3),
                            borderRadius: BorderRadius.circular(22))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
