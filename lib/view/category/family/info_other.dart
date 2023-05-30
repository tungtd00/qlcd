// ignore_for_file: unused_local_variable, non_constant_identifier_names, prefer_const_constructors, sort_child_properties_last, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/api/graphql_server.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/generated/l10n.dart';
import 'package:qlcd/provider/member/basic_info_provider.dart';
import 'package:qlcd/provider/member/other_info_provider.dart';
import 'package:qlcd/view/dialog/notification_dialog.dart';
import 'package:qlcd/widget/primary_button.dart';
import 'package:qlcd/widget/primary_text_field.dart';

import 'member_screen.dart';

class OtherInfo extends StatefulWidget {
  String? dependentId;

  OtherInfo({required this.dependentId, super.key});

  @override
  State<OtherInfo> createState() => _OtherInfoState();
}

class _OtherInfoState extends State<OtherInfo> {
  bool rememberAC = false;

  String convertDateFormat(String inputDate) {
    List<String> parts = inputDate.split('/');
    String year = parts[2];
    String month = parts[1].padLeft(2, '0');
    String day = parts[0].padLeft(2, '0');
    return '$year-$month-$day';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Form(
        key: context.read<OtherInfoProvider>().formkeyOther,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vpad(12),
            PrimaryTextField(
              controller: context.read<OtherInfoProvider>().phoneTextCtr,
              validator: (v) {
                return context.read<OtherInfoProvider>().validatePhone();
              },
              validateString: context.watch<OtherInfoProvider>().phoneValidate,
              textColor: Colors.black,
              label: S.of(context).phone,
              hint: "Nhập",
              isRequired: true,
            ),
            vpad(12),
            PrimaryTextField(
              controller: context.read<OtherInfoProvider>().emailTextCtr,
              textColor: Colors.black,
              label: "Email",
              hint: "Nhập",
              isRequired: false,
            ),
            vpad(12),
            Text(
              "Link thông tin MXH :",
              style: txtBodySmallRegular(color: grayScaleColorBase),
            ),
            vpad(12),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/facebook.png"),
                  hpad(12),
                  Expanded(
                      child: PrimaryTextField(
                    controller: context.read<OtherInfoProvider>().fbTextCtr,
                    textColor: Colors.black,
                  ))
                ],
              ),
            ),
            vpad(24),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/instagram.png"),
                  hpad(12),
                  Expanded(
                      child: PrimaryTextField(
                    controller:
                        context.read<OtherInfoProvider>().instagramTextCtr,
                    textColor: Colors.black,
                  ))
                ],
              ),
            ),
            vpad(24),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/linkedin.png",
                    fit: BoxFit.contain,
                  ),
                  hpad(12),
                  Expanded(
                      child: PrimaryTextField(
                    controller:
                        context.read<OtherInfoProvider>().linkedinTextCtr,
                    textColor: Colors.black,
                  ))
                ],
              ),
            ),
            vpad(24),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      "assets/images/tiktok.png",
                      fit: BoxFit.contain,
                    ),
                    height: 32,
                    width: 32,
                  ),
                  hpad(12),
                  Expanded(
                      child: PrimaryTextField(
                    controller: context.read<OtherInfoProvider>().tiktokTextCtr,
                    textColor: Colors.black,
                  ))
                ],
              ),
            ),
            vpad(24),
            Row(
              children: [
                Container(
                  height: 19,
                  width: 19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.grey,
                  ),
                  child: Checkbox(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                        Radius.circular(6),
                      )),
                      checkColor: secondaryColor7,
                      activeColor: Colors.white,
                      value: rememberAC,
                      onChanged: (_) {
                        setState(() {
                          rememberAC = !rememberAC;
                        });
                      }),
                ),
                hpad(24),
                Text(
                  "Tạo tài khoản",
                  style: txtBodySmallRegular(color: Colors.black),
                ),
              ],
            ),
            vpad(24),
            Container(
              width: double.infinity,
              child: PrimaryButton(
                text: "Thêm mới",
                buttonSize: ButtonSize.large,
                buttonType: ButtonType.primary,
                onTap: () async {
                  if (context.read<OtherInfoProvider>().validateOtherInfo()) {
                    print("validator pass");
                    String info_name =
                        context.read<BasicInfoProvider>().fullnameTextCtr.text;
                    String? sex = context.read<BasicInfoProvider>().valueSex;
                    String dateStr =
                        context.read<BasicInfoProvider>().dateTextCtr.text;
                    String date = convertDateFormat(dateStr);
                    DateTime dateTime = DateTime.parse(date);
                    String date_birth = dateTime.toIso8601String();
                    String nationnalId =
                        context.read<BasicInfoProvider>().nationalTextCtr.text;
                    print(nationnalId);
                    String phone_required =
                        context.read<OtherInfoProvider>().phoneTextCtr.text;
                    String email =
                        context.read<OtherInfoProvider>().emailTextCtr.text;
                    String facebok =
                        context.read<OtherInfoProvider>().fbTextCtr.text;
                    String linkedin =
                        context.read<OtherInfoProvider>().linkedinTextCtr.text;
                    String tiktok =
                        context.read<OtherInfoProvider>().tiktokTextCtr.text;
                    String instagram =
                        context.read<OtherInfoProvider>().instagramTextCtr.text;
                    var b = DateTime.now().millisecondsSinceEpoch.toString();
                    // ignore: prefer_interpolation_to_compose_strings
                    String code = 'test-' + b;
                    print("mã cd : $code");
                    String identity_card_required =
                        context.read<BasicInfoProvider>().CCCDTextCtr.text;
                    String? residence_type =
                        context.read<BasicInfoProvider>().valueTypeResidence;
                    String? result = await GraphQLServer().addResident(
                        info_name,
                        sex!,
                        date_birth,
                        nationnalId,
                        phone_required,
                        email,
                        facebok,
                        instagram,
                        linkedin,
                        tiktok,
                        identity_card_required,
                        residence_type!,
                        code);
                    if (result == null) {
                      String apartmentId = "6364e791ae0b76c349168193";
                      String floorId = "6364e686ae0b76c34916818d";
                      String buildingId = "6363239fae0b76c349166bee";
                      String? relationshipId =
                          context.read<BasicInfoProvider>().valueRelationship;
                      String? resultOwnInfo = await GraphQLServer().addOwnInfo(
                          apartmentId,
                          widget.dependentId!,
                          buildingId,
                          floorId,
                          relationshipId!,
                          phone_required);
                      if (resultOwnInfo == null) {
                        if (rememberAC) {
                          String? resultaddAcc = await GraphQLServer().saveAcc(
                              email, "123456", info_name, phone_required);
                          if (resultaddAcc == null) {
                            Navigator.pushReplacementNamed(
                                context, MemberScreen.routesName);
                          } else {
                            NotificationDialog.showDialog(
                                S.of(context).notification,
                                resultaddAcc,
                                context);
                          }
                        } else {
                          Navigator.pushReplacementNamed(
                              context, MemberScreen.routesName);
                        }
                      } else {
                        NotificationDialog.showDialog(
                            S.of(context).notification, resultOwnInfo, context);
                      }
                    } else {
                      NotificationDialog.showDialog(
                          S.of(context).notification, result, context);
                    }
                  } else {}
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
