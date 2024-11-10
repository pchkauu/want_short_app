import 'dart:async';

import 'package:short/src/core/_barrel.dart';

Future<void> main() async {
  await runZonedGuarded(
    entryDevelopment,
    Log.handleGlobal,
  );
}
