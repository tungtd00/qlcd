import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/provider/auth_provider/change_password.dart';

import '../../api/graphql_server.dart';
import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../auth/new_password.dart';
import '../auth/sign_in.dart';
import '../dialog/notification_dialog.dart';

class VerifyOTPChangePassword extends StatefulWidget {
  static const routesName = '/otp_change_pass';

  const VerifyOTPChangePassword({Key? key}) : super(key: key);

  @override
  State<VerifyOTPChangePassword> createState() =>
      _VerifyOTPChangePasswordState();
}

class _VerifyOTPChangePasswordState extends State<VerifyOTPChangePassword> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignIn.routesName);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          vpad(24),
          Text(
            "Nhập mã bảo mật",
            style: txtDisplayMedium(color: grayScaleColor1),
          ),
          vpad(12),
          Text(
            "Vui lòng kiểm tra điện thoại để xem tin nhắn văn bản có mã. Mã của bạn có 6 ký tự.",
            style: txtBodySmallBold(color: grayScaleColor2),
            textAlign: TextAlign.center,
          ),
          vpad(12),
          Text(
            "Chúng tôi đã gửi cho bạn mã đến :\n ${context.watch<ChangePasswordProvider>().phoneEmailController.text}",
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
                            onTap: () async {},
                            child: Text(
                              S.of(context).resend,
                              style: txtLinkSmall(color: secondaryColor8),
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              setState(() {
                                time(second);
                                otpTextController.clear();
                              });
                              String email = context
                                  .read<ChangePasswordProvider>()
                                  .phoneEmailController
                                  .text;
                              String? otp =
                                  await GraphQLServer().resendOtp(email);
                              if (otp != null) {
                                NotificationDialog.showDialog(
                                    S.current.notification, otp, context);
                              }
                            },
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
                  String email = context
                      .read<ChangePasswordProvider>()
                      .phoneEmailController
                      .text;
                  String? checkOTP = await GraphQLServer().checkOtp(email, otp);
                  if (checkOTP == null) {
                    Navigator.pushReplacementNamed(
                        context, NewPassword.routesName);
                  } else {
                    NotificationDialog.showDialog(
                        S.of(context).notification, checkOTP, context);
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
