import 'package:flutter/material.dart';

import 'model/activity_model.dart';

final activitiesListMock = [
  Activity(
    title: "Wake Up",
    description:
        "I usually sleep 15 minutes more and then get up.\nSometimes I make the bed.",
    initialDatetime: DateTime(2022, 1, 1, 7, 0),
    finalDatetime: DateTime(2022, 1, 1, 7, 15),
    createdAt: DateTime.now(),
    icon: Icons.alarm,
  ),
  Activity(
    title: "Coffee and Breakfast",
    description:
        "I have a cup of coffee and make breakfast.\nThen, I read the news while have breakfast.",
    initialDatetime: DateTime(2022, 1, 1, 7, 30),
    finalDatetime: DateTime(2022, 1, 1, 8, 0),
    createdAt: DateTime.now(),
    icon: Icons.coffee,
  ),
  Activity(
    title: "Get ready to work",
    description: "I take a shower and get dressed.\nAnd finally, go to work.",
    initialDatetime: DateTime(2022, 1, 1, 8, 0),
    finalDatetime: DateTime(2022, 1, 1, 9, 45),
    createdAt: DateTime.now(),
    icon: Icons.shower,
  ),
  Activity(
    title: "At work",
    // description:
    //     "Check my list of priorities\nConquer the priorities.\nWork for 8 hours.",
    initialDatetime: DateTime(2022, 1, 1, 9, 0),
    finalDatetime: DateTime(2022, 1, 1, 18, 0),
    createdAt: DateTime.now(),
    icon: Icons.work,
  ),
];
