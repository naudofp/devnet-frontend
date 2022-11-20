import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 70,
                  child: Text(
                    'General',
                    textAlign: TextAlign.end,
                  )),
              Container(
                  child: Column(children: <Widget>[
                _option(
                  title: 'Logout',
                  function: () {
                    print('logout');
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                _option(
                    function: () {
                      print('remove');
                    },
                    title: 'Delete Account',
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ))
              ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget _option(
      {required Function() function,
      required String title,
      required Icon icon}) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
        child: Container(
          width: 500,
          height: 55,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                child: icon,
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(50)),
              ),
              SizedBox(
                width: 25,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }
}
