import 'package:flutter/material.dart';

import '../../../model/user_model.dart';

class MessengerBottomNav extends StatefulWidget {
  UserModel? model;

  MessengerBottomNav({Key? key, required this.model}) : super(key: key);

  @override
  State<MessengerBottomNav> createState() => _MessengerBottomNavState();
}

class _MessengerBottomNavState extends State<MessengerBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 250, 254, 1),
      body: Center(
        child: Text("messenger"),
      ),
    );
    ;
  }
}
