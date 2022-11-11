import 'package:flutter/material.dart';
import 'package:schooltech/app/views/components/card_outline_border.dart';
import 'package:schooltech/app/views/components/switch_theme.dart';
import 'package:schooltech/app/controllers/app_controller.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 177, 136),
        title: const Text(
          'Java + Angular',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
        actions: [SwitchThemeButton()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 25, right: 25, bottom: 30),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Java + Angular',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400),
                ),
                Text('Entra21', style: TextStyle(fontSize: 18)),
                Padding(padding: EdgeInsets.only(top: 60)),
                Container(
                  width: 200,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 3.5,
                          color: AppController.instance.isDark
                              ? Colors.white
                              : Colors.black)),
                  child: Center(
                      child: Text(
                    '+' + '150',
                    style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                        color: AppController.instance.isDark
                            ? Color.fromARGB(255, 49, 255, 56)
                            : Color.fromARGB(255, 1, 157, 6)),
                  )),
                ),
                Padding(padding: EdgeInsets.only(top: 60)),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  child: Column(
                    children: [
                      Text(
                        'Some Students',
                        style: TextStyle(fontSize: 35),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 402,
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Fellipe',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text('Blumenau',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 5,
                                      color: Color.fromARGB(255, 0, 177, 136))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
