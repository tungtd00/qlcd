// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/provider/auth_provider/auth_provider.dart';
import 'package:qlcd/provider/auth_provider/sign_in_provider.dart';
import 'package:qlcd/view/auth/fogot_password.dart';
import 'package:qlcd/view/auth/sign_up.dart';
import 'package:qlcd/view/dialog/notification_dialog.dart';
import 'package:qlcd/view/home/home.dart';
import 'package:qlcd/view/splash/splash_screen.dart';

import '../../constant/constants.dart';
import '../../generated/l10n.dart';
import '../../widget/primary_text_field.dart';

class SignIn extends StatefulWidget {
  static const routesName = '/login';

  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  bool rememberAC = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, SplashScreen.routesName);
          },
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: context.read<SignInProvider>().formKeySignIn,
          child: Column(children: [
            vpad(12),
            Text(
              S.of(context).wellcome_back,
              style: txtDisplayMedium(color: grayScaleColor1),
              textAlign: TextAlign.center,
            ),
            vpad(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${S.of(context).have_acc_yet}    ",
                    style: txtLinkSmall(color: grayScaleColor2),
                    textAlign: TextAlign.center,
                    softWrap: true),
                Expanded(
                  child: InkWell(
                    child: Text("${S.of(context).sign_up}",
                        style: txtLinkSmall(color: secondaryColor6),
                        softWrap: true,
                        textAlign: TextAlign.center),
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, SignUp.routesName);
                    },
                  ),
                )
              ],
            ),
            vpad(24),
            PrimaryTextField(
              textColor: Colors.black,
              label: S.of(context).username,
              onChangedText: (val) {
                context.read<SignInProvider>().validateEmail();
              },
              validator: (v) {
                return context.read<SignInProvider>().validateEmail();
              },
              //validateMode: AutovalidateMode.onUserInteraction,
              controller:
                  context.read<SignInProvider>().emailSignInTextController,
              validateString:
                  context.watch<SignInProvider>().emailSignInValidate,
              blockSpace: false,
              isRequired: true,
              hint: S.of(context).enter_phone_email,
            ),
            vpad(12),
            PrimaryTextField(
              textColor: Colors.black,
              onChangedText: (val) {
                context.read<SignInProvider>().validatePassword();
              },
              label: S.of(context).password,
              validator: (v) {
                return context.read<SignInProvider>().validatePassword();
              },
              validateString:
                  context.read<SignInProvider>().passwordSignInValidate,
              controller:
                  context.read<SignInProvider>().passwordSignInTextController,
              blockSpace: false,
              isRequired: true,
              hint: "••••••••",
              obscureText: true,
            ),
            vpad(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                        checkColor: secondaryColor7,
                        activeColor: Colors.white,
                        value: rememberAC,
                        onChanged: (_) {
                          setState(() {
                            rememberAC = !rememberAC;
                          });
                        }),
                    Text(
                      "${S.of(context).save_password} ",
                      style: txtLinkSmall(color: blueColor2),
                    ),
                  ],
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, ForgotPassword.routesName);
                    },
                    child: Text(S.of(context).forgot_password,
                        style: txtLinkSmall(color: blueColor2),
                        softWrap: true,
                        textAlign: TextAlign.center),
                  ),
                )
              ],
            ),
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
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () async {
                  String email = context
                      .read<SignInProvider>()
                      .emailSignInTextController
                      .text;
                  String pass = context
                      .read<SignInProvider>()
                      .passwordSignInTextController
                      .text;

                  if (context.read<SignInProvider>().signInValidate()) {
                    if (await context
                        .read<AuthProvider>()
                        .SignIn(email, pass)) {
                      //
                      context.read<SignInProvider>().disposeTextController();

                      Navigator.pushReplacementNamed(context, Home.routesName);
                    } else {
                      NotificationDialog.showDialog(S.of(context).notification,
                          S.of(context).wrong_email_pass, context);
                    }
                  }
                },
                child: Text(
                  S.of(context).sign_in,
                  style: txtLinkMedium(),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
