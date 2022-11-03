import 'package:app_flutter/timeline_screen.dart';
import 'package:flutter/material.dart';

import 'activities_mock.dart';
import 'colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Daily Timeline Routine",
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
