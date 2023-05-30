import 'package:flutter/material.dart';
import 'package:qlcd/view/auth/fogot_password.dart';
import 'package:qlcd/view/auth/new_password.dart';
import 'package:qlcd/view/auth/sign_in.dart';
import 'package:qlcd/view/auth/sign_up.dart';
import 'package:qlcd/view/category/family/add_member.dart';
import 'package:qlcd/view/category/family/member_screen.dart';
import 'package:qlcd/view/home/home.dart';
import 'package:qlcd/view/root/root_screen.dart';
import 'package:qlcd/view/splash/splash_screen.dart';
import 'package:qlcd/view/verify/verify_otp_change_password.dart';
import 'package:qlcd/view/verify/verify_otp_screen.dart';

class AppRoutes {
  Route onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RootScreen.routesName:
        return MaterialPageRoute(
          builder: (_) => const RootScreen(),
          settings: routeSettings,
        );
      case SplashScreen.routesName:
        return MaterialPageRoute(
          builder: (_) => SplashScreen(),
          settings: routeSettings,
        );
      case SignIn.routesName:
        return MaterialPageRoute(
            builder: (_) => SignIn(), settings: routeSettings);
      case SignUp.routesName:
        return MaterialPageRoute(
            builder: (_) => SignUp(), settings: routeSettings);
      case VerifyOTPScreen.routesName:
        return MaterialPageRoute(
            builder: (_) => VerifyOTPScreen(), settings: routeSettings);
      case Home.routesName:
        return MaterialPageRoute(
            builder: (_) => Home(), settings: routeSettings);
      case MemberScreen.routesName:
        return MaterialPageRoute(
            builder: (_) => MemberScreen(), settings: routeSettings);
      case AddMember.routesName:
        return MaterialPageRoute(
            builder: (_) => AddMember(), settings: routeSettings);
      case ForgotPassword.routesName:
        return MaterialPageRoute(
            builder: (_) => ForgotPassword(), settings: routeSettings);
      case VerifyOTPChangePassword.routesName:
        return MaterialPageRoute(
            builder: (_) => VerifyOTPChangePassword(), settings: routeSettings);
      case NewPassword.routesName:
        return MaterialPageRoute(
            builder: (_) => NewPassword(), settings: routeSettings);
      default:
        return MaterialPageRoute(
          builder: (_) => const RootScreen(),
          settings: routeSettings,
        );
    }
  }
}
