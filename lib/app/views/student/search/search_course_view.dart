import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:schooltech/app/views/components/card_outline_border.dart';
import 'package:schooltech/app/views/components/switch_theme.dart';

class SearchCourse extends StatelessWidget {
  const SearchCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 177, 136),
        title: const Text(
          'Search Courses',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [SwitchThemeButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
          child: Container(
              child: Column(
            children: [
              Text(
                'Courses',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search here...',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {},
              ),
              SizedBox(
                height: 50,
              ),
              CardOutlineBorder(
                title: 'Java + Angular',
                subtitle: 'Entra21',
                sizeTitle: 20,
                sizeSubtitle: 20,
                route: '/details-course',
              )
            ],
          )),
        ),
      ),
    );
  }
}
