import 'package:short/src/foundation/_barrel.dart';

extension NumX on num {
  /// 123000.3 => _barrel.dart 000.30
  String get formatPrettyCurrency {
    // Parse the string to a double
    return toString().formatPrettyCurrency;
  }
}
