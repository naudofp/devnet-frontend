import 'package:flutter/material.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 180,
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 45,
              width: 45,
              child: CircularProgressIndicator(
                color: const Color.fromARGB(255, 0, 177, 136),
                strokeWidth: 4,
              ),
            ),
            Padding(padding: EdgeInsets.all(8)),
            Text(
              'Loading',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
