// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/generated/l10n.dart';
import 'package:qlcd/model/user_model.dart';
import 'package:qlcd/provider/auth_provider/auth_provider.dart';

import 'tab/account_bottom_nav.dart';
import 'tab/calender_bottom_nav.dart';
import 'tab/home_bottom_nav.dart';
import 'tab/messeger_bottom_nav.dart';

class Home extends StatefulWidget {
  static const routesName = '/home';

  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel? userModel;

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    userModel = context.watch<AuthProvider>().userModel;
    print("user home :${userModel.toString()}");
    final screenBottomNav = [
      HomeBottomNav(
        model: userModel,
        context_tab: context,
      ),
      CalenderBottomNav(
        model: userModel,
      ),
      MessengerBottomNav(
        model: userModel,
      ),
      AccountBottomNav(
        model: userModel,
      ),
    ];
    return Scaffold(
      bottomNavigationBar: Container(
        height: 98,
        decoration: BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(color: grayScaleColor2, blurRadius: 10, spreadRadius: 0)
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(26), topRight: Radius.circular(26)),
          child: BottomNavigationBar(
            selectedLabelStyle: txtLinkXSmall(color: secondaryColor6),
            currentIndex: pageIndex,
            backgroundColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedItemColor: secondaryColor6,
            unselectedItemColor: grayScaleColor4,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: S.of(context).home,
              ),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/calender.svg",
                      colorFilter: pageIndex == 1
                          ? ColorFilter.mode(secondaryColor6, BlendMode.srcIn)
                          : null),
                  label: S.of(context).calendar),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/icons/bxs-chat-copy.svg",
                      colorFilter: pageIndex == 2
                          ? ColorFilter.mode(secondaryColor6, BlendMode.srcIn)
                          : null),
                  label: S.of(context).message),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle),
                  label: S.of(context).account),
            ],
            onTap: (int index) {
              setState(() {
                pageIndex = index;
              });
            },
          ),
        ),
      ),
      body: screenBottomNav[pageIndex],
    );
  }
}
