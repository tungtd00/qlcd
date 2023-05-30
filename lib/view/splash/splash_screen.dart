// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qlcd/constant/constants.dart';
import 'package:qlcd/view/auth/sign_in.dart';
import 'package:qlcd/view/auth/sign_up.dart';

import '../../../generated/l10n.dart';
import '../../widget/primary_button.dart';

class SplashScreen extends StatefulWidget {
  static const routesName = '/splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: heightDevice,
        width: widthDevice,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Image.asset("assets/images/Background.png"),
              // SvgPicture.asset ("assets/images/background_splash.svg"),
            ),
            SizedBox(height: 12),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: heightDevice * 1 / 22,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/qlcd_logo.png",
                      width: widthDevice / 4,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "FAMILY",
                      style: txtDisplayMedium(color: grayScaleColor2),
                    ),
                    Text(
                      "Home Community Smart Living",
                      style: txtLinkSmall(color: grayScaleColor2),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 24),
                    SvgPicture.asset("assets/images/Illustration .svg"),
                    Container(
                      // height: heightDevice*1.4/22,
                      width: widthDevice * 0.7,
                      child: PrimaryButton(
                        text: S.of(context).sign_in,
                        buttonType: ButtonType.white,
                        buttonSize: ButtonSize.large,
                        textColor: primaryColor2,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignIn.routesName);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Container(
                      // height: heightDevice*1.4/22,
                      width: widthDevice * 0.7,
                      decoration: BoxDecoration(
                        gradient: gradientBlueButton,
                        borderRadius: BorderRadius.circular(56),
                      ),
                      child: PrimaryButton(
                        text: S.of(context).sign_up,
                        buttonSize: ButtonSize.large,
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, SignUp.routesName);
                        },
                      ),
                      // child: ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.transparent,
                      //     elevation: 0,
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(56),
                      //     ),
                      //   ),
                      //   onPressed: () {
                      //     Navigator.pushReplacementNamed(context, SignUp.routesName);
                      //   },
                      //   child: Text(
                      //     S.of(context).sign_up,
                      //     style: txtLinkMedium(),
                      //   ),
                      // ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
