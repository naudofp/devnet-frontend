import 'package:flutter/material.dart';
import 'package:schooltech/app/controllers/app_controller.dart';

class SwitchThemeButton extends StatelessWidget {
  const SwitchThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: AppController.instance.isDark
            ? Icon(Icons.light_mode)
            : Icon(Icons.dark_mode),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        onPressed: () => {AppController.instance.changeTheme()});
  }
}
