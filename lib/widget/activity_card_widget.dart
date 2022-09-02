import 'package:flutter/material.dart';

import '../model/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const constraints =
        BoxConstraints(minWidth: 344, maxWidth: 344, minHeight: 148);
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: constraints,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(activity.description ?? ''),
          ],
        ),
      ),
    );
  }
}
