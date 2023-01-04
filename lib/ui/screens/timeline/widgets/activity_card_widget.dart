import 'package:flutter/material.dart';

import '../../../../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({
    Key? key,
    required this.activity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              activity.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            if (activity.description.isNotEmpty)
              Text(
                activity.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(height: 1.5),
              ),
          ],
        ),
      ),
    );
  }
}
