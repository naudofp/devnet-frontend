import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';

class CardOutlineBorder extends StatelessWidget {
  final String title;
  final String subtitle;
  final double sizeTitle;
  final double sizeSubtitle;
  final String route;

  const CardOutlineBorder({
    required this.title,
    required this.subtitle,
    required this.sizeTitle,
    required this.sizeSubtitle,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: InkWell(
        onTap: () {
          if (this.route != "") Navigator.of(context).pushNamed(route);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: sizeTitle),
                ),
                Text(subtitle, style: TextStyle(fontSize: sizeSubtitle))
              ],
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                  width: 1,
                  color: AppController.instance.isDark
                      ? Colors.white
                      : Colors.black)),
        ),
      ),
    );
  }
}
