import 'package:flutter/material.dart';

import '../../../model/user_model.dart';

class CalenderBottomNav extends StatefulWidget {
  UserModel? model;

  CalenderBottomNav({Key? key, required this.model}) : super(key: key);

  @override
  State<CalenderBottomNav> createState() => _CalenderBottomNavState();
}

class _CalenderBottomNavState extends State<CalenderBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(231, 250, 254, 1),
      body: Center(
        child: Text("Calender"),
      ),
    );
    ;
  }
}
