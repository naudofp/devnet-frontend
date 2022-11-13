import 'dart:math';

import 'package:custom_signin_buttons/button_list.dart';
import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';

class CardHomeStudent extends StatelessWidget {
  final String text;
  final String route;

  const CardHomeStudent({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ElevatedButton(
          child: Text(text),
          onPressed: () {
            Navigator.of(context).pushNamed(route);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppController.instance.isDark
                  ? Color.fromARGB(255, 117, 117, 117)
                  : const Color.fromARGB(255, 0, 177, 136),
              fixedSize: Size(600, 150),
              textStyle: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              elevation: 10,
              padding: EdgeInsets.only(left: 30),
              alignment: Alignment.centerLeft)),
    );
  }
}
