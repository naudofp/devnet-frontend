import 'package:flutter/material.dart';

class AlertErrorComponent extends StatelessWidget {
  const AlertErrorComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 200,
        child: AlertDialog(
          backgroundColor: Colors.red,
          content: Center(
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 40,
                  child: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Ops, something be wrong',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
