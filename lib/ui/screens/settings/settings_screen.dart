import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    List<_ItemGroup> groupAccount = [
      _ItemGroup("Profile", () {}),
      _ItemGroup("Subscription", () {}),
      _ItemGroup("Calendar Sync", () {}),
    ];
    List<_ItemGroup> groupPreferences = [
      _ItemGroup("Theme", () {}),
      _ItemGroup("Notifications", () {}),
      _ItemGroup("Date and time", () {}),
    ];
    List<_ItemGroup> groupAbout = [
      _ItemGroup("About", () {}),
      _ItemGroup("End-User License Agreement", () {}),
      _ItemGroup("Privacy policy", () {}),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// GROUP 1
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 12.0),
            child: Text(
              "Account",
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
          _GroupWidget(groupAccount),
          const SizedBox(height: 16.0),

          /// GROUP 2
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            child: Text(
              "Preferences",
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
          _GroupWidget(groupPreferences),

          /// GROUP 3
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
            ),
            child: Text(
              "About",
              style:
                  textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
          _GroupWidget(groupAbout),
        ],
      ),
    );
  }
}

class _GroupWidget extends StatelessWidget {
  final List<_ItemGroup> itemsGroup;

  const _GroupWidget(this.itemsGroup);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: itemsGroup.length,
      itemBuilder: (_, index) => InkWell(
        onTap: itemsGroup[index].action,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(itemsGroup[index].title, style: textTheme.bodyMedium),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(height: 0, thickness: 1.5);
      },
    );
  }
}

class _ItemGroup {
  final String title;
  final VoidCallback action;

  const _ItemGroup(this.title, this.action);
}
