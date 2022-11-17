import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final postEmail = TextEditingController();
  final postPassword = TextEditingController();
  final postStreet = TextEditingController();
  final postCity = TextEditingController();
  final postCountry = TextEditingController();
  final postState = TextEditingController();
  final postNumber = TextEditingController();

  @override
  Widget _body() {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 30),
      child: Container(
        width: 800,
        height: 580,
        color: Colors.white,
        child: Theme(
          data: Theme.of(context).copyWith(
              brightness: Brightness.light,
              colorScheme:
                  ColorScheme.light(primary: Color.fromARGB(255, 0, 177, 136))),
          child: Stepper(
            controlsBuilder: (context, details) {
              return Container(
                child: Row(
                  children: [
                    if (currentStep == 0)
                      Expanded(
                          child: ElevatedButton(
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color.fromARGB(255, 228, 228, 228)),
                        onPressed: () => Navigator.of(context).pushNamed('/'),
                      ))
                    else
                      Expanded(
                          child: ElevatedButton(
                        child: Text('BACK'),
                        onPressed: details.onStepCancel,
                      )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: ElevatedButton(
                      child: currentStep == 2 ? Text('REGISTER') : Text('NEXT'),
                      onPressed: details.onStepContinue,
                    )),
                  ],
                ),
              );
            },
            onStepTapped: (value) => setState(() => currentStep = value),
            type: StepperType.horizontal,
            steps: _steps(),
            currentStep: currentStep,
            onStepContinue: () async {
              if (currentStep == 2) {
                var student = StudentRegisterModel(
                    name: postName.text,
                    email: postEmail.text,
                    city: postCity.text,
                    country: postCountry.text,
                    number: postNumber.text.isEmpty
                        ? null
                        : int.parse(postNumber.text),
                    password: postPassword.text,
                    state: postState.text,
                    street: postStreet.text);

                await controller.postStudent(student);

                if (controller.state == StudentState.SUCCESS) {
                  Navigator.of(context).pushNamed('/login');
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      title: 'Congratulations');
                } else if (controller.state == StudentState.ERROR) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      title: 'Something be wrong');
                }
              } else
                setState(() => currentStep += 1);
            },
            onStepCancel: currentStep == 0
                ? null
                : () => setState(() => currentStep -= 1),
          ),
        ),
      ),
    ));
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

  List<Step> _steps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: Text('Account'),
        content: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 380,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Let's Start,\nStep 1 - Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                            controller: postName,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                ),
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        TextField(
                            controller: postEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email_outlined),
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: Text('Address'),
        content: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 20),
          child: Container(
            height: 380,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Step 2 - Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 330,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextField(
                            controller: postCountry,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                labelText: 'Country',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(Icons.flag_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        TextField(
                            controller: postState,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.flag_outlined),
                                labelText: 'State',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        TextField(
                            controller: postCity,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                labelText: 'City',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(Icons.location_city_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        TextField(
                            controller: postStreet,
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.streetview_outlined),
                                labelText: 'Street',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        TextField(
                            controller: postNumber,
                            onChanged: (value) => setState(() => value),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: InputDecoration(
                                labelText: 'Number',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                prefixIcon: Icon(Icons.house_outlined),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: Text('Password'),
        content: Padding(
          padding: const EdgeInsets.only(bottom: 30, top: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 350,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Step 3 - Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 25),
                  SizedBox(
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextField(
                            controller: postPassword,
                            obscureText: true,
                            onChanged: (value) => setState(() {
                                  errorText = _errorText(value);
                                }),
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                        TextField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            onChanged: (value) => setState(() {
                                  errorText = _errorText(value);
                                }),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock_outline),
                                labelText: 'Confirm Password',
                                errorText: errorText,
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ];
  }

  String? _errorText(String? value) {
    final firstPassword = postPassword.text;

    if (value != firstPassword) {
      return 'Invalid';
    }
    return null;
  }
}
