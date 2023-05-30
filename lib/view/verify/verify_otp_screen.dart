import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/model/user_model.dart';
import 'package:qlcd/view/auth/sign_in.dart';
import 'package:qlcd/view/auth/sign_up.dart';
import 'package:qlcd/view/dialog/notification_dialog.dart';

import '../../api/graphql_server.dart';
import '../../generated/l10n.dart';

class VerifyOTPScreen extends StatefulWidget {
  static const routesName = '/verify_otp';

  const VerifyOTPScreen({super.key});

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  String otp = '';
  late StreamController<int> _controller;
  Timer? _timer;
  int second = 30;
  bool resend = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    time(second);
  }

  time(int s) {
    resend = false;
    _controller = StreamController<int>();
    _controller.add(s);
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (s - timer.tick >= 0) {
        _controller.add(s - timer.tick);
      } else {
        resend = true;
        _timer!.cancel();
        _controller.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController otpTextController = TextEditingController();
    UserModel userModel =
        ModalRoute.of(context)?.settings.arguments as UserModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignUp.routesName);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          vpad(24),
          Text(
            S.of(context).verify_otp,
            style: txtDisplayMedium(color: grayScaleColor1),
          ),
          vpad(12),
          Text(
            S.of(context).lable_verify_otp,
            style: txtBodySmallBold(color: grayScaleColor2),
            textAlign: TextAlign.center,
          ),
          vpad(48),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: PinCodeTextField(
              textStyle: TextStyle(color: Colors.black),
              appContext: context,
              length: 6,
              controller: otpTextController,
              onChanged: (value) async {
                if (value.length == 6) {
                  setState(() {
                    otp = value;
                    print("otp :$otp");
                  });
                }
              },
              enableActiveFill: true,
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 40,
                  fieldWidth: dvWidth(context) * 1 / 10,
                  inactiveFillColor: Colors.white,
                  borderWidth: 1,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white),
            ),
          ),
          vpad(24),
          StreamBuilder<int>(
              stream: _controller.stream,
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "${S.of(context).did_not_receive_otp}  ",
                        style: txtBodySmallBold(color: grayScaleColor2),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    resend
                        ? InkWell(
                            onTap: () async {
                              setState(() {
                                time(second);
                                otpTextController.clear();
                              });
                              var result = await GraphQLServer().sendOTP(
                                  userModel.email.toString(),
                                  userModel.phone.toString(),
                                  userModel.username.toString());
                              if (result != null) {
                                NotificationDialog.showDialog(
                                    S.of(context).notification,
                                    result.toString(),
                                    context);
                              }
                            },
                            child: Text(
                              S.of(context).resend,
                              style: txtLinkSmall(color: secondaryColor8),
                            ),
                          )
                        : InkWell(
                            onTap: () async {},
                            child: Text(
                              S.of(context).resend,
                              style: txtLinkSmall(color: grayScaleColor6),
                            ),
                          ),
                    Text(
                      "  (${snapshot.data}s)",
                      style: txtLinkSmall(color: grayScaleColor6),
                    )
                  ],
                );
              }),
          vpad(48),
          Container(
            decoration: BoxDecoration(
              gradient: gradientBlueButton,
              borderRadius: BorderRadius.circular(50),
            ),
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () async {
                if (otp.length == 6) {
                  String? email = userModel.email;
                  if (userModel != null) {
                    print("${otp}");
                    String? checkOTP =
                        await GraphQLServer().checkOtp(email!, otp);
                    if (checkOTP == null) {
                      String? save = await GraphQLServer().saveAcc(
                          email,
                          userModel.password!,
                          userModel.username!,
                          userModel.phone!);
                      if (save == null) {
                        print("save thanh cong");
                        Navigator.pushReplacementNamed(
                            context, SignIn.routesName);
                      } else {
                        NotificationDialog.showDialog(
                            S.current.notification, save, context);
                      }
                    } else {
                      NotificationDialog.showDialog(
                          S.of(context).notification, checkOTP, context);
                    }
                  }
                  // NotificationDialog.showDialog(S.current.notification,S.current.account_not_avaiable, context);
                }
              },
              child: Text(
                S.of(context).verify,
                style: txtLinkMedium(color: Colors.white),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
