import 'package:app_flutter/colors.dart';
import 'package:app_flutter/widget/activity_card_widget.dart';
import 'package:flutter/material.dart';

import 'activities_mock.dart';
import 'model/activity_model.dart';

class TimelineScreen extends StatelessWidget {
  final List<Activity> activitiesList;

  const TimelineScreen({Key? key, required this.activitiesList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: activitiesList.length + 2,
      itemBuilder: (context, idx) {
        if (idx == 0) return _buildInitialWidget();
        if (idx == activitiesListMock.length + 1) return _buildFinalWidget();
        return _buildListItem(activitiesListMock[idx - 1], context);
      },
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

  Widget _buildListItem(Activity activity, context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              _buildActivityIcon(activity.icon),
              Expanded(child: Container(color: primary, width: 5)),
            ],
          ),
          const SizedBox(width: 8.0),
          Expanded(child: _buildActivityItem(activity, context)),
        ],
      ),
    );
  }

  Widget _buildActivityIcon(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: const ShapeDecoration(shape: CircleBorder(), color: primary),
      child: Center(child: Icon(icon, color: Colors.white, size: 30)),
    );
  }

  Widget _buildActivityItem(Activity activity, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4.0),
          child: _buildHour(activity, context),
        ),
        Row(children: [Expanded(child: ActivityCard(activity: activity))]),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildHour(Activity activity, BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text:
                "${activity.initialDatetime.hour}:${activity.initialDatetime.minute.toString().padRight(2, '0')}\n",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: primary, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text:
                "${activity.initialDatetime.hour}:${activity.initialDatetime.minute.toString().padRight(2, '0')} - ${activity.finalDatetime!.hour}:${activity.finalDatetime!.minute.toString().padRight(2, '0')}",
            style:
                Theme.of(context).textTheme.bodyText1?.copyWith(color: primary),
          ),
        ],
      ),
    );
  }
}
