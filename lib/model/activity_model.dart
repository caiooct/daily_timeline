import 'package:flutter/material.dart';

class Activity {
  late String title;
  String? description;
  late DateTime initialDatetime;
  DateTime? finalDatetime;
  late DateTime createdAt;
  late IconData icon;

  Activity({
    title,
    description,
    initialDatetime,
    finalDatetime,
    createdAt,
    icon,
  });
}
