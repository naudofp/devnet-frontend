import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schooltech/app/views/components/card_outline_border.dart';

class YourCourses extends StatelessWidget {
  final int? idUser;

  const YourCourses({super.key, this.idUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
        child: Column(
          children: [
            Center(
                child: Text(
              'Your Courses',
              style: TextStyle(fontSize: 30),
            )),
            SizedBox(height: 50),
            CardOutlineBorder(
              title: 'Java',
              subtitle: 'Alura',
              sizeTitle: 20,
              sizeSubtitle: 20,
              route: "/details-course",
            ),
            CardOutlineBorder(
              title: 'UI/UX',
              subtitle: 'Alura',
              sizeTitle: 20,
              sizeSubtitle: 20,
              route: "/details-course",
            ),
            CardOutlineBorder(
              title: 'Python',
              subtitle: 'Entra21',
              sizeTitle: 20,
              sizeSubtitle: 20,
              route: "/details-course",
            )
          ],
        ),
      ),
    );
  }
}
