import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

Future alertRegister(BuildContext context) {
  return QuickAlert.show(
    context: context,
    type: QuickAlertType.custom,
    barrierDismissible: true,
    backgroundColor: Colors.white70,
    customAsset: 'assets/images/example.gif',
    confirmBtnText: 'Close',
    confirmBtnColor: Colors.white,
    width: 400,
    confirmBtnTextStyle: TextStyle(color: Color.fromARGB(255, 78, 78, 78)),
    widget: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Column(
        children: [
          Text(
            'Tell me, how do you want to register?',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushNamed('/new-university');
                },
                icon: Icon(
                  Icons.synagogue,
                  color: Colors.black,
                ),
                label: Text(
                  'University',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(125, 45),
                    backgroundColor: Colors.blue[200]),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/new-student');
                },
                icon: Icon(
                  Icons.school,
                  color: Colors.black,
                ),
                label: Text(
                  'Student',
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(125, 45),
                    backgroundColor: Colors.blue[200]),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
