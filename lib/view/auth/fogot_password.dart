import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/api/graphql_server.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/provider/auth_provider/change_password.dart';
import 'package:qlcd/view/auth/sign_in.dart';
import 'package:qlcd/view/dialog/notification_dialog.dart';
import 'package:qlcd/view/verify/verify_otp_change_password.dart';
import 'package:qlcd/widget/primary_button.dart';
import 'package:qlcd/widget/primary_text_field.dart';

import '../../generated/l10n.dart';

class ForgotPassword extends StatefulWidget {
  static const routesName = '/forgot_pass';

  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? validate = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SignIn.routesName);
          },
          color: Colors.black,
        ),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            vpad(24),
            Text(
              S.of(context).forgot_password,
              style: txtDisplayMedium(color: grayScaleColor1),
              textAlign: TextAlign.center,
            ),
            vpad(36),
            Form(
              key: context.read<ChangePasswordProvider>().formKeyEmail,
              child: PrimaryTextField(
                onChangedText: (v) {
                  context.read<ChangePasswordProvider>().validatePhoneEmail();
                },
                textColor: Colors.black,
                label: S.of(context).phone_email,
                isRequired: true,
                hint: S.of(context).enter_phone_email,
                controller:
                    context.read<ChangePasswordProvider>().phoneEmailController,
                validator: (v) {
                  return context
                      .read<ChangePasswordProvider>()
                      .validatePhoneEmail();
                },
                validateString:
                    context.watch<ChangePasswordProvider>().phoneEmailValidate,
                blockSpace: false,
              ),
            ),
            vpad(64),
            Container(
              width: double.infinity,
              child: PrimaryButton(
                textColor: Colors.white,
                buttonType: ButtonType.primary,
                buttonSize: ButtonSize.large,
                text: "Tiếp tục",
                onTap: () async {
                  if (context
                      .read<ChangePasswordProvider>()
                      .emailNotValidate()) {
                    String email = context
                        .read<ChangePasswordProvider>()
                        .phoneEmailController
                        .text;
                    String? error = await GraphQLServer().resendOtp(email);
                    if (error == null) {
                      Navigator.pushReplacementNamed(
                          context, VerifyOTPChangePassword.routesName);
                    } else {
                      NotificationDialog.showDialog(
                          S.of(context).notification, error, context);
                    }
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
