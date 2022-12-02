import 'package:flutter/material.dart';

import 'settings/activities_mock.dart';
import 'settings/colors.dart';
import 'ui/screens/splash/splash_screen.dart';
import 'ui/screens/timeline/timeline_screen.dart';

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
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: primary,
          title: const Text("Daily Timeline"),
        ),
        body: TimelineScreen(activitiesList: activitiesListMock),
      ),
    );
  }
}
