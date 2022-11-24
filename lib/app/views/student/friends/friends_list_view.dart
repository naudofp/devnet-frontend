import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FriendsListView extends StatefulWidget {
  const FriendsListView({super.key});

  @override
  State<FriendsListView> createState() => _FriendsListViewState();
}

class _FriendsListViewState extends State<FriendsListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Will have in version 1.2.0")),
    );
  }
}
