extension StringX on String {
  /// 123 000.31 => 123000.31
  String get formatCurrency {
    return replaceAll(RegExp(r'[^\d.]'), '');
  }

  /// 1234567812345678 => 1234 5678 1234 5678
  /// 1234АБВГД5678 => same
  /// 1234 567812345678 =>same
  String get formatRequisites {
    final onlyNumber = RegExp(r'^\d+$');

    if (onlyNumber.hasMatch(this) && length == 16) {
      final upd = replaceAllMapped(RegExp('.{4}'), (match) => '${match.group(0)} ');

      return upd;
    }

    return this;
  }

  /// 123000.3 => 123 000.30
  String get formatPrettyCurrency {
    // Parse the string to a double
    final value = double.tryParse(this) ?? 0;

    // If the number has no meaningful decimal part, treat it as an integer
    if (value % 1 == 0) {
      return value
          .toInt()
          .toString()
          .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ' ');
    } else {
      // Remove trailing zeros and format with spaces
      var formatted = value.toStringAsFixed(2);
      if (formatted.endsWith('.00')) {
        formatted = formatted.substring(0, formatted.length - 3);
      }
      return formatted.replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ' ');
    }
  }
}
