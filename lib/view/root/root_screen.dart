import 'package:flutter/material.dart';
import 'package:qlcd/view/splash/splash_screen.dart';

class RootScreen extends StatelessWidget {
  static const routesName = '/';

  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}
