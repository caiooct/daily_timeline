import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../settings/datetime_extension.dart';

import '../../../models/activity_model.dart';
import '../../../settings/activities_mock.dart';
import '../../../settings/colors.dart';
import 'widgets/activity_card_widget.dart';

class TimelineScreen extends StatelessWidget {
  final List<Activity> activitiesList;

  const TimelineScreen({Key? key, required this.activitiesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            Text(
              DateFormat.yMMMM().format(today),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          ],
        ),
        bottom: const _BottomAppBar(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: activitiesList.length + 2,
        itemBuilder: (context, idx) {
          if (idx == 0) return _buildInitialWidget();
          if (idx == activitiesListMock.length + 1) return _buildFinalWidget();
          return _ActivityItemWidget(activity: activitiesList[idx - 1]);
        },
      ),
    );
  }

  Widget _buildInitialWidget() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 24,
            decoration:
                const ShapeDecoration(shape: CircleBorder(), color: primary),
          ),
          Container(
            color: primary,
            width: 5,
            height: 24,
          ),
        ],
      ),
    );
  }

  Widget _buildFinalWidget() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        children: [
          Container(
            width: 48,
            height: 24,
            decoration:
                const ShapeDecoration(shape: CircleBorder(), color: primary),
          ),
        ],
      ),
    );
  }
}

class _BottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    DateTime iterableDay = today.subtract(Duration(days: today.weekday));
    return IntrinsicHeight(
      child: Row(
        children: List.generate(
          DateTime.daysPerWeek,
          (_) {
            bool isToday = iterableDay.isOnSameDayAs(today);
            Widget textWidget = Text(
              "${iterableDay.day}",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isToday ? primary : Colors.white,
              ),
            );
            if (iterableDay.isOnSameDayAs(today)) {
              textWidget = Flexible(
                flex: 1,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 12,
                  child: textWidget,
                ),
              );
            }
            final widget = Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Column(
                  children: [
                    Text(
                      DateFormat.E().format(iterableDay),
                      style: const TextStyle(color: Colors.white),
                    ),
                    textWidget,
                  ],
                ),
              ),
            );
            iterableDay = iterableDay.add(const Duration(days: 1));
            return widget;
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 64.0);
}

class _ActivityItemWidget extends StatelessWidget {
  final Activity activity;

  const _ActivityItemWidget({required this.activity});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: primary),
                child: Center(
                    child: Icon(activity.icon, color: Colors.white, size: 30)),
              ),
              Expanded(child: Container(color: primary, width: 5)),
            ],
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "${DateFormat.jm().format(activity.initialDatetime).toLowerCase()}\n",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(
                                  color: primary, fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              "${DateFormat.jm().format(activity.initialDatetime).toLowerCase()} - ${DateFormat.jm().format(activity.finalDatetime!).toLowerCase()}",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: primary),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [Expanded(child: ActivityCard(activity: activity))],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
