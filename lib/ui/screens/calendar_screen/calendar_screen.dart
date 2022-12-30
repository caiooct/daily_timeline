import 'package:app_flutter/settings/datetime_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      body: _Calendar(),
      bottomNavigationBar: null, // TODO: Create bottomNavigationBar
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({Key? key}) : super(key: key);
  static const _bottomHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    final weekDays = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_view_month,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            )),
      ],
      title: Text(
        DateFormat.yMMMM().format(DateTime.now()),
        style: const TextStyle(color: Colors.white),
      ),
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, _bottomHeight),
        child: Row(
          children: List.generate(
            DateTime.daysPerWeek,
            (j) => Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 8.0, bottom: 12),
                child: Text(
                  weekDays[j],
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + _bottomHeight);
}

class _Calendar extends StatelessWidget {
  const _Calendar();

  @override
  Widget build(BuildContext context) {
    final grid = _initGrid();
    return Column(
      children: [
        for (int i = 0; i < grid.length; i++)
          Expanded(child: Row(children: grid[i])),
      ],
    );
  }

  List<List<Widget>> _initGrid() {
    DateTime currentDate = DateTime.now();

    DateTime iterableDay = currentDate.firstDayOfMonth;
    if (currentDate.firstDayOfMonth.weekday != DateTime.sunday) {
      iterableDay = currentDate.firstDayOfMonth
          .subtract(Duration(days: currentDate.firstDayOfMonth.weekday));
    }

    var grid = List.generate(
      currentDate.numberOfWeeks,
      (i) => List.generate(DateTime.daysPerWeek, (j) {
        Widget widget = _CellWidget(
          idxRow: i,
          idxColumn: j,
          dateTime: iterableDay,
        );
        iterableDay = iterableDay.add(const Duration(days: 1));
        return widget;
      }),
    );

    return grid;
  }
}

class _CellWidget extends StatelessWidget {
  const _CellWidget({
    required this.dateTime,
    required this.idxRow,
    required this.idxColumn,
  });

  final DateTime dateTime;
  final int idxRow;
  final int idxColumn;

  @override
  Widget build(BuildContext context) {
    bool isToday = dateTime.isOnSameDayAs(DateTime.now());
    bool isInThisMonth = dateTime.month == DateTime.now().month;
    Widget textWidget = Text(
      "${dateTime.day}",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: isInThisMonth ? Colors.black : const Color(0xFFCCCCCC),
      ),
    );
    if (isToday) {
      textWidget = CircleAvatar(
        foregroundColor: Colors.white,
        maxRadius: 16,
        child: textWidget,
      );
    }
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(border: _mapBorder()),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: isToday ? 4.0 : 8.0),
          child: textWidget,
        ),
      ),
    );
  }

  Border _mapBorder() {
    bool isLastRow = idxRow == dateTime.numberOfWeeks - 1;
    if (idxColumn == 0) {
      return isLastRow
          ? ContainerBorder.borderLTRB.border
          : ContainerBorder.borderLTR.border;
    } else {
      return isLastRow
          ? ContainerBorder.borderTRB.border
          : ContainerBorder.borderTR.border;
    }
  }
}

enum ContainerBorder {
  borderLTRB(
    Border(
      left: BorderSide(color: Color(0xFFE6E6E6)),
      top: BorderSide(color: Color(0xFFE6E6E6)),
      right: BorderSide(color: Color(0xFFE6E6E6)),
      bottom: BorderSide(color: Color(0xFFE6E6E6)),
    ),
  ),
  borderTRB(
    Border(
      top: BorderSide(color: Color(0xFFE6E6E6)),
      right: BorderSide(color: Color(0xFFE6E6E6)),
      bottom: BorderSide(color: Color(0xFFE6E6E6)),
    ),
  ),
  borderLTR(
    Border(
      left: BorderSide(color: Color(0xFFE6E6E6)),
      top: BorderSide(color: Color(0xFFE6E6E6)),
      right: BorderSide(color: Color(0xFFE6E6E6)),
    ),
  ),
  borderTR(
    Border(
      top: BorderSide(color: Color(0xFFE6E6E6)),
      right: BorderSide(color: Color(0xFFE6E6E6)),
    ),
  );

  const ContainerBorder(this.border);

  final Border border;
}
