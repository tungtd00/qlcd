import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/generated/l10n.dart';
import 'package:qlcd/model/user_model.dart';
import 'package:qlcd/view/category/family/member_screen.dart';
import 'package:qlcd/view/splash/splash_screen.dart';
import 'package:qlcd/widget/category.dart';

class HomeBottomNav extends StatefulWidget {
  UserModel? model;
  BuildContext context_tab;

  HomeBottomNav({Key? key, required this.model, required this.context_tab})
      : super(key: key);

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    // widget.model = context.watch<AuthProvider>().userModel;
    print("hometab ${widget.model.toString()}");
    return Container(
      decoration: BoxDecoration(
        gradient: gradientBackground,
      ),
      child: Scaffold(
        // backgroundColor: Color.fromRGBO(213, 231, 246, 1.0),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 72,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: grayScaleColor8, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, SplashScreen.routesName);
                                },
                                icon: SvgPicture.asset(
                                  "assets/icons/SignOut.svg",
                                )),
                            Text("FAMILY",
                                style:
                                    txtDisplayMedium(color: grayScaleColor1)),
                            Icon(Icons.notifications_none, size: 30),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: secondaryColor6,
                            ),
                            Text("   ${S.of(context).hello},",
                                style: txtBodyXMediumRegular(
                                    color: grayScaleColor1)),
                            Text(
                              " ${widget.model?.username}",
                              style: txtLinkXMedium(color: grayScaleColor1),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              height: heightDevice * 1 / 10,
                              width: widthDevice * 2 / 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                              height: heightDevice * 1 / 10,
                              width: widthDevice * 2 / 5,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 18,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Text(
                    S.of(context).family_management,
                    style: txtLinkXMedium(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryItem(
                      svgIcon: "assets/icons/family_category_item.svg",
                      label: S.of(context).member,
                      ontap: () {
                        print("ontap");
                        Navigator.pushReplacementNamed(
                            widget.context_tab, MemberScreen.routesName);
                      },
                    ),
                    CategoryItem(
                        svgIcon: "assets/icons/hand-gesture-smartphone.svg",
                        label: S.of(context).permissions),
                    CategoryItem(
                        svgIcon: "assets/icons/wallet-wallet-svgrepo.svg",
                        label: S.of(context).expense),
                    CategoryItem(
                        svgIcon: "assets/icons/location.svg",
                        label: S.of(context).location),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  child: Text(
                    S.of(context).task_management,
                    style: txtLinkXMedium(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryItem(
                        svgIcon: "assets/icons/add.svg",
                        label: S.of(context).creat_task),
                    CategoryItem(
                        svgIcon: "assets/icons/add-user-left-3.svg",
                        label: S.of(context).assign_task),
                    CategoryItem(
                        svgIcon:
                            "assets/icons/checklist-check-list-list-svgrepo-com1.svg",
                        label: S.of(context).result),
                    CategoryItem(
                      svgIcon: "assets/icons/bell-svgrepo-com1.svg",
                      label: S.of(context).reminder,
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  child: Text(
                    S.of(context).statement,
                    style: txtLinkXMedium(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoryItem(
                        svgIcon:
                            "assets/icons/men-and-women-wearing-masks-children-svgrepo-com1.svg",
                        label: S.of(context).child_activity),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
