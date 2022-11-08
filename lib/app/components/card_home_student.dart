import 'dart:math';

import 'package:custom_signin_buttons/button_list.dart';
import 'package:flutter/material.dart';

class CardHomeStudent extends StatelessWidget {
  final String text;
  final String route;

  const CardHomeStudent({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(text),
        onPressed: () {
          Navigator.of(context).pushNamed(route);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 65, 145, 126),
            fixedSize: Size(600, 150),
            textStyle: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
            elevation: 10,
            padding: EdgeInsets.only(left: 30),
            alignment: Alignment.centerLeft));
  }
}
