import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class YourUniversity extends StatelessWidget {
  final int? idUser;

  const YourUniversity({super.key, this.idUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Your University')),
    );
  }
}
