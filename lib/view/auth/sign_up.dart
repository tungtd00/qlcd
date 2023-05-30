// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/api/graphql_server.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/model/user_model.dart';
import 'package:qlcd/provider/auth_provider/sign_up_provider.dart';
import 'package:qlcd/view/auth/sign_in.dart';
import 'package:qlcd/view/dialog/notification_dialog.dart';
import 'package:qlcd/view/splash/splash_screen.dart';
import 'package:qlcd/view/verify/verify_otp_screen.dart';
import 'package:qlcd/widget/primary_text_field.dart';

import '../../generated/l10n.dart';

class SignUp extends StatefulWidget {
  static const routesName = '/signup';

  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: context.read<SignUpProvider>().formKeySignUp,
            child: Column(
              children: [
                vpad(12),
                Text(
                  S.of(context).sign_up,
                  style: txtDisplayMedium(color: grayScaleColor1),
                ),
                vpad(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text("${S.of(context).have_acc}   ",
                          style: txtLinkSmall(color: grayScaleColor2)),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        child: Text(
                          S.of(context).sign_in,
                          style: txtLinkSmall(color: secondaryColor6),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignIn.routesName);
                        },
                      ),
                    )
                  ],
                ),
                //
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        vpad(24),
                        PrimaryTextField(
                          textColor: Colors.black,
                          // validateMode:AutovalidateMode.onUserInteraction ,
                          onChangedText: (val) {
                            context.read<SignUpProvider>().validateName();
                          },
                          validator: (v) {
                            return context
                                .read<SignUpProvider>()
                                .validateName();
                          },
                          label: S.of(context).full_name,
                          controller:
                              context.read<SignUpProvider>().nameTextController,
                          validateString:
                              context.watch<SignUpProvider>().nameValidate,
                          blockSpace: false,
                          isRequired: true,
                          hint: S.of(context).enter_full_name,
                        ),
                        vpad(12),
                        PrimaryTextField(
                          textColor: Colors.black,
                          onChangedText: (val) {
                            if (val.isEmpty) {}
                            context.read<SignUpProvider>().validatePhone();
                          },
                          validator: (v) {
                            return context
                                .read<SignUpProvider>()
                                .validatePhone();
                          },
                          // validateMode:AutovalidateMode.onUserInteraction ,
                          label: S.of(context).phone,
                          controller: context
                              .read<SignUpProvider>()
                              .phoneTextController,
                          validateString:
                              context.watch<SignUpProvider>().phoneValidate,
                          blockSpace: false,
                          isRequired: true,
                          hint: "(XXX) XXX XXXX",
                        ),
                        vpad(12),
                        PrimaryTextField(
                          textColor: Colors.black,
                          textInputAction: TextInputAction.done,
                          onChangedText: (val) {
                            context.read<SignUpProvider>().validateEmail();
                          },
                          validator: (v) {
                            return context
                                .read<SignUpProvider>()
                                .validateEmail();
                          },
                          label: "Email",
                          controller: context
                              .read<SignUpProvider>()
                              .emailSignUpTextController,
                          validateString: context
                              .watch<SignUpProvider>()
                              .emailSignUpValidate,
                          // validateMode:AutovalidateMode.onUserInteraction ,
                          blockSpace: false,
                          isRequired: true,
                          hint: S.of(context).enter_email,
                        ),
                        vpad(12),
                        PrimaryTextField(
                          textColor: Colors.black,
                          textInputAction: TextInputAction.done,
                          label: S.of(context).password,
                          onChangedText: (val) {
                            context.read<SignUpProvider>().validatePassword();
                          },
                          validator: (v) {
                            return context
                                .read<SignUpProvider>()
                                .validatePassword();
                          },
                          controller: context
                              .read<SignUpProvider>()
                              .passwordSignUpTextController,
                          // validateMode:AutovalidateMode.onUserInteraction ,
                          validateString: context
                              .watch<SignUpProvider>()
                              .passwordSignUpValidate,
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
                            return context
                                .read<SignUpProvider>()
                                .validateRePassword();
                          },
                          controller: context
                              .read<SignUpProvider>()
                              .rePasswordSignUpTextController,
                          // validateMode:AutovalidateMode.onUserInteraction ,
                          validateString: context
                              .watch<SignUpProvider>()
                              .rePasswordSignUpValidate,
                          blockSpace: false,
                          isRequired: true,
                          hint: "••••••••",
                          obscureText: true,
                        ),
                        vpad(12),
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              child: Checkbox(
                                  checkColor: secondaryColor7,
                                  activeColor: Colors.white,
                                  value: rememberAC,
                                  onChanged: (_) {
                                    setState(() {
                                      rememberAC = !rememberAC;
                                    });
                                  }),
                            ),
                            Expanded(
                                child: Wrap(
                              children: [
                                Text(
                                  "${S.of(context).confirm_agreement_with} ",
                                  style: txtLinkSmall(color: grayScaleColor2),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    S.of(context).terms_services,
                                    style: txtLinkSmall(color: blueColor2),
                                  ),
                                ),
                              ],
                            ))
                          ],
                        ),
                        vpad(24),
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
                              String name = context
                                  .read<SignUpProvider>()
                                  .nameTextController
                                  .text;
                              String phone = context
                                  .read<SignUpProvider>()
                                  .phoneTextController
                                  .text;
                              String email = context
                                  .read<SignUpProvider>()
                                  .emailSignUpTextController
                                  .text;
                              String password = context
                                  .read<SignUpProvider>()
                                  .passwordSignUpTextController
                                  .text;
                              UserModel user = UserModel(
                                  username: name,
                                  phone: phone,
                                  email: email,
                                  password: password);
                              if (context.read<SignUpProvider>().SignUp()) {
                                String? result = await GraphQLServer()
                                    .sendOTP(email, phone, name);
                                if (result == null) {
                                  context
                                      .read<SignUpProvider>()
                                      .disposeSignUpTextController();
                                  Navigator.pushReplacementNamed(
                                      context, VerifyOTPScreen.routesName,
                                      arguments: user);
                                } else {
                                  NotificationDialog.showDialog(
                                      S.of(context).notification,
                                      result,
                                      context);
                                }
                              }
                            },
                            child: Text(
                              S.of(context).sign_up,
                              style: txtLinkMedium(),
                            ),
                          ),
                        ),
                        vpad(24)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
