import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/api/graphql_server.dart';
import 'package:qlcd/provider/auth_provider/change_password.dart';
import 'package:qlcd/provider/auth_provider/sign_up_provider.dart';
import 'package:qlcd/view/auth/fogot_password.dart';
import 'package:qlcd/view/auth/sign_in.dart';
import 'package:qlcd/view/dialog/notification_dialog.dart';
import 'package:qlcd/widget/primary_button.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widget/primary_text_field.dart';

class NewPassword extends StatefulWidget {
  static const routesName = '/new_pass';

  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, ForgotPassword.routesName);
          },
        ),
      ),
      backgroundColor: backgroundColor,
      body: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.center,
        child: Form(
          key: context.read<SignUpProvider>().formKeyChangePass,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            vpad(24),
            Text(
              "Tạo mật khẩu mới",
              style: txtDisplayMedium(color: grayScaleColor1),
              textAlign: TextAlign.center,
            ),
            vpad(36),
            PrimaryTextField(
              textColor: Colors.black,
              textInputAction: TextInputAction.done,
              label: S.of(context).password,
              onChangedText: (val) {
                context.read<SignUpProvider>().validatePassword();
              },
              validator: (v) {
                return context.read<SignUpProvider>().validatePassword();
              },
              controller:
                  context.read<SignUpProvider>().passwordSignUpTextController,
              // validateMode:AutovalidateMode.onUserInteraction ,
              validateString:
                  context.watch<SignUpProvider>().passwordSignUpValidate,
              blockSpace: false,
              isRequired: true,
              hint: "••••••••",
              obscureText: true,
            ),
            vpad(12),
            PrimaryTextField(
              textColor: Colors.black,
              textInputAction: TextInputAction.done,
              label: S.of(context).re_password,
              onChangedText: (val) {
                context.read<SignUpProvider>().validateRePassword();
              },
              validator: (v) {
                return context.read<SignUpProvider>().validateRePassword();
              },
              controller:
                  context.read<SignUpProvider>().rePasswordSignUpTextController,
              // validateMode:AutovalidateMode.onUserInteraction ,
              validateString:
                  context.watch<SignUpProvider>().rePasswordSignUpValidate,
              blockSpace: false,
              isRequired: true,
              hint: "••••••••",
              obscureText: true,
            ),
            vpad(24),
            Container(
              width: double.infinity,
              child: PrimaryButton(
                onTap: () async {
                  if (context.read<SignUpProvider>().ChangePass()) {
                    String password = context
                        .read<SignUpProvider>()
                        .passwordSignUpTextController
                        .text;
                    String email = context
                        .read<ChangePasswordProvider>()
                        .phoneEmailController
                        .text;
                    String? result =
                        await GraphQLServer().changePass(email, password);
                    if (result == null) {
                      Navigator.pushReplacementNamed(
                          context, SignIn.routesName);
                    } else {
                      NotificationDialog.showDialog(
                          S.of(context).notification, result, context);
                    }
                  }
                },
                text: S.of(context).verify,
                buttonSize: ButtonSize.large,
                buttonType: ButtonType.primary,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
