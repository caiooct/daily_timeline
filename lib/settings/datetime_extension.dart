extension DateTimeExtension on DateTime {
  bool isOnSameDayAs(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  int get numberOfWeeks {
    int numberOfDays =
        lastDayOfMonth
            .difference(firstDayOfMonth)
            .inDays;
    return (numberOfDays / 7).ceil();
  }

  DateTime get firstDayOfMonth => DateTime(year, month, 1);

  DateTime get lastDayOfMonth => DateTime(year, month + 1, 0);
}
