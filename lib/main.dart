import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:qlcd/constant/theme.dart';
import 'package:qlcd/provider/auth_provider/auth_provider.dart';
import 'package:qlcd/provider/auth_provider/change_password.dart';
import 'package:qlcd/provider/auth_provider/sign_up_provider.dart';
import 'package:qlcd/provider/member/basic_info_provider.dart';
import 'package:qlcd/provider/member/other_info_provider.dart';
import 'package:qlcd/routes/routes.dart';

import 'generated/l10n.dart';
import 'provider/auth_provider/sign_in_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpProvider>(create: (_) => SignUpProvider()),
        ChangeNotifierProvider<SignInProvider>(create: (_) => SignInProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
        ChangeNotifierProvider<ChangePasswordProvider>(
            create: (_) => ChangePasswordProvider()),
        ChangeNotifierProvider<BasicInfoProvider>(
            create: (_) => BasicInfoProvider()),
        ChangeNotifierProvider<OtherInfoProvider>(
            create: (_) => OtherInfoProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AppRoutes _appRoutes = AppRoutes();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context,child){
      //   return MediaQuery(
      //       data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      //       child: child!
      //   );
      // },
      debugShowCheckedModeBanner: false,
      title: 'DEMEGO',
      theme: AppTheme.lightTheme(),
      onGenerateRoute: _appRoutes.onGenerateRouter,
      locale: const Locale.fromSubtags(languageCode: "vi"),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
