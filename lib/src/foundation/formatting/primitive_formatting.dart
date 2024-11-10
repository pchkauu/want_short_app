extension IntFormatting on int? {
  DateTime toDate() {
    if (this == null) return DateTime.now();

    return DateTime.fromMillisecondsSinceEpoch(this! * 1000, isUtc: true);
  }
}

extension DateTimeFormatting on DateTime {
  int toSeconds() => (toUtc().millisecondsSinceEpoch / 1000).round();

  int? toSecondsNullable() {
    return (toUtc().millisecondsSinceEpoch / 1000).round();
  }
}

extension DateTimeNullableFormatting on DateTime? {}
