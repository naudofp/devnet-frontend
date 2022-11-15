import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/views/components/alert_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => __WelcomePageState();
}

class __WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 50));

  @override
  void initState() {
    super.initState();
    findUser().then((value) {
      if (value != null)
        Navigator.of(context).pushReplacementNamed(value);
      else
        startAnimation();
    });
  }

  @override
  void dispose() {
    animationController.notifyStatusListeners(AnimationStatus.dismissed);
    animationController.dispose();
    super.dispose();
  }

  startAnimation() {
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      } else if (status == AnimationStatus.dismissed)
        animationController.forward();
    });

    animationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  Future<String?> findUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('idUser') != null) {
      if (prefs.getString('role') == 'STUDENT_USER')
        return '/home-student';
      else
        return '/login';
    } else
      return null;
  }

  Widget _body() {
    return Center(
      child: Container(
        width: 250,
        height: 470,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(
                  Icons.school_rounded,
                  size: 200,
                  color: Colors.white,
                ),
                Text(
                  'SCHOOLTECH',
                  style: TextStyle(
                      fontFamily: 'Sono', fontSize: 25, color: Colors.white),
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
                      backgroundColor: Color.fromARGB(255, 0, 177, 136),
                      fixedSize: Size(220, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22))),
                ),
                SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    alertRegister(context);
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 0, 177, 136),
                      fixedSize: Size(220, 55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22))),
                )
              ],
            ),
          ],
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
          child: AnimatedScale(
            duration: Duration(),
            scale: animationController.value + 1,
            child: Image.asset('assets/images/background_login.jpg',
                fit: BoxFit.cover),
          ),
        ),
        _body(),
      ],
    ));
  }
}

class DialogUser extends StatelessWidget {
  const DialogUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 500,
        height: 700,
        child: AlertDialog(
          content: Container(),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
