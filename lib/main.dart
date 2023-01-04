import 'package:app_flutter/ui/screens/login/login_screen.dart';
import 'package:flutter/material.dart';

import 'settings/colors.dart';
import 'ui/screens/splash/splash_screen.dart';

void main() async {
  runApp(const SplashScreen());
  await Future.delayed(const Duration(milliseconds: 500));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily Timeline Routine",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: primary,
          onPrimary: primaryDark,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
