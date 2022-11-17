import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';

class CardOutlineBorder extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final double sizeTitle;
  final double sizeSubtitle;
  final VoidCallback? onPressed;

  const CardOutlineBorder(
      {this.title,
      this.subtitle,
      required this.sizeTitle,
      required this.sizeSubtitle,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? '',
              style: TextStyle(fontSize: sizeTitle),
            ),
            Text(subtitle ?? '', style: TextStyle(fontSize: sizeSubtitle))
          ],
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color:
                  AppController.instance.isDark ? Colors.white : Colors.black)),
    );
  }
}
