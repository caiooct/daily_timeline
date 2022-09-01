import 'package:flutter/material.dart';

class Activity {
  late String title;
  String? description;
  late DateTime initialDatetime;
  DateTime? finalDatetime;
  late DateTime createdAt;
  IconData icon;

  Activity({
    required this.title,
    this.description,
    required this.initialDatetime,
    this.finalDatetime,
    required this.createdAt,
    this.icon = Icons.event_note,
  });
}
