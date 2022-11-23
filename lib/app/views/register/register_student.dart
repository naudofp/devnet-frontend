import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:quickalert/quickalert.dart';
import 'package:schooltech/app/controllers/app_controller.dart';
import 'package:schooltech/app/controllers/student_controller.dart';
import 'package:schooltech/app/controllers/user_controller.dart';
import 'package:schooltech/app/models/student/student_register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterStudent extends StatefulWidget {
  const RegisterStudent({super.key});

  @override
  State<RegisterStudent> createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  var currentStep = 0;
  String? errorText = '';

  StudentController controller = StudentController();
  UserController userController = UserController();

  final postName = TextEditingController();
  final postUsername = TextEditingController();
  final postPassword = TextEditingController();

  @override
  Widget _body() {
    return SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 30),
            child: Container(
                width: 500,
                height: 400,
                child: Theme(
                    data: Theme.of(context).copyWith(
                        brightness: Brightness.light,
                        colorScheme: ColorScheme.dark(
                            primary: Color.fromARGB(255, 0, 177, 136),
                            secondary: Colors.white)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              BackButton(
                                  color: Colors.white,
                                  onPressed: (() {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/');
                                  })),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Let's Start",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        shadows: [
                                          Shadow(
                                              color: Color.fromARGB(
                                                  255, 0, 177, 136),
                                              blurRadius: 20)
                                        ],
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              _form(),
                              ElevatedButton(
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color:
                                              Color.fromARGB(255, 0, 177, 136),
                                          width: 2),
                                    ),
                                    backgroundColor: Colors.transparent,
                                    fixedSize: Size(500, 45)),
                                onPressed: () async {
                                  var student = StudentRegisterModel(
                                      name: postName.text,
                                      password: postPassword.text,
                                      username: postUsername.text);

                                  if (student.name != "" &&
                                      student.username != "" &&
                                      student.password != "") {
                                    await controller.postStudent(student);

                                    if (controller.state ==
                                        StudentState.SUCCESS) {
                                      Navigator.of(context).pushNamed('/login');
                                      QuickAlert.show(
                                          context: context,
                                          type: QuickAlertType.success,
                                          title: 'Congratulations');
                                    } else if (controller.state ==
                                        StudentState.ERROR) {
                                      final snackBar = SnackBar(
                                        duration: Duration(seconds: 2),
                                        content: Row(
                                          children: [
                                            Text(
                                              postUsername.text +
                                                  ' is already registered',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                        backgroundColor: Colors.red,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  } else {
                                    QuickAlert.show(
                                        context: context,
                                        type: QuickAlertType.error,
                                        title: 'No Authorized');
                                  }
                                },
                              )
                            ]),
                      ),
                    )))));
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

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextField(
            style: TextStyle(color: Colors.white),
            controller: postName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)))),
        SizedBox(
          height: 15,
        ),
        TextField(
            style: TextStyle(color: Colors.white),
            controller: postUsername,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                ),
                labelText: 'Username',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)))),
        SizedBox(
          height: 15,
        ),
        TextField(
            controller: postPassword,
            style: TextStyle(color: Colors.white),
            obscureText: true,
            onChanged: (value) => setState(() {
                  errorText = _errorText(value);
                }),
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)))),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  String? _errorText(String value) {
    if (value.length < 4) return "Toos short";
    if (!value.contains(RegExp("r'[0-9]'")) &&
        !value.contains(RegExp("r'[a-z]'")))
      return "Has contains numbers and numbers";

    return "";
  }
}
