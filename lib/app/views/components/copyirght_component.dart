import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CopyrightComponent extends StatelessWidget {
  const CopyrightComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 500,
      child: Center(
          child: Text(
        'Copyright © 2022  Fellipe Naudo',
        style: TextStyle(color: Colors.grey),
      )),
    );
  }
}
