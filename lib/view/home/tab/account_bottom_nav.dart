import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/generated/l10n.dart';
import 'package:qlcd/provider/auth_provider/auth_provider.dart';

import '../../../model/user_model.dart';

class AccountBottomNav extends StatefulWidget {
  UserModel? model;

  AccountBottomNav({Key? key, required this.model}) : super(key: key);

  @override
  State<AccountBottomNav> createState() => _AccountBottomNavState();
}

bool checkClick = false;
int a = 0;

class _AccountBottomNavState extends State<AccountBottomNav> {
  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(
                height: 36,
              ),
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: SvgPicture.asset("assets/icons/Avatar.svg"),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    context.watch<AuthProvider>().userModel?.username ?? "",
                    style: txtLinkLarge(color: grayScaleColor1),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: heightDevice * 3 / 5 + a,
                width: widthDevice,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.account_circle_outlined),
                      title: Text(
                        S.of(context).person_profile,
                        style: txtBodySmallBold(color: grayScaleColor1),
                      ),
                      iconColor: secondaryColor6,
                      trailing:
                          GestureDetector(child: Icon(Icons.chevron_right)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.home_outlined),
                      title: Text(
                        S.of(context).premises_information,
                        style: txtBodySmallBold(color: grayScaleColor1),
                      ),
                      iconColor: secondaryColor6,
                      trailing:
                          GestureDetector(child: Icon(Icons.chevron_right)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset("assets/icons/planet.svg"),
                      title: Text(
                        S.of(context).language,
                        style: txtBodySmallBold(color: grayScaleColor1),
                      ),
                      iconColor: secondaryColor6,
                      trailing:
                          GestureDetector(child: Icon(Icons.chevron_right)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: SvgPicture.asset("assets/icons/new_paper.svg"),
                      title: Text(
                        S.of(context).terms_services,
                        style: txtBodySmallBold(color: grayScaleColor1),
                      ),
                      iconColor: secondaryColor6,
                      trailing:
                          GestureDetector(child: Icon(Icons.chevron_right)),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_outline),
                      title: Text(
                        S.of(context).change_password,
                        style: txtBodySmallBold(color: grayScaleColor1),
                      ),
                      iconColor: secondaryColor6,
                      trailing:
                          GestureDetector(child: Icon(Icons.chevron_right)),
                      onTap: () {},
                    ),
                    ExpansionTile(
                      onExpansionChanged: (check) {
                        setState(() {
                          checkClick = check;
                          if (checkClick) {
                            a = 102;
                          } else {
                            a = 0;
                          }
                        });
                      },
                      shape: Border(
                        top: BorderSide.none,
                      ),
                      leading: Icon(
                        Icons.settings_outlined,
                        color: secondaryColor6,
                      ),
                      title: Text(
                        S.of(context).setting,
                        style: txtBodySmallBold(color: grayScaleColor1),
                      ),
                      iconColor: secondaryColor6,
                      collapsedTextColor: Colors.black,
                      trailing: GestureDetector(
                        child: !checkClick
                            ? Icon(
                                Icons.chevron_right,
                                color: secondaryColor6,
                              )
                            : SvgPicture.asset(
                                "assets/icons/Chevron_top.svg",
                                color: secondaryColor6,
                              ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              ListTile(
                                leading: Icon(Icons.phone_android_outlined),
                                title: Text(
                                  S.of(context).device,
                                  style:
                                      txtBodySmallBold(color: grayScaleColor1),
                                ),
                                iconColor: secondaryColor6,
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(Icons.hourglass_empty_outlined),
                                title: Text(
                                  S.of(context).usage_time,
                                  style:
                                      txtBodySmallBold(color: grayScaleColor1),
                                ),
                                iconColor: secondaryColor6,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_outline),
                      title: Text(
                        S.of(context).logout,
                        style: txtBodySmallBold(color: grayScaleColor1),
                      ),
                      iconColor: secondaryColor6,
                      trailing:
                          GestureDetector(child: Icon(Icons.chevron_right)),
                      onTap: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
    ;
  }
}
