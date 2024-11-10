import 'dart:async';

import 'package:flutter/material.dart';
import 'package:short/src/core/_barrel.dart';
import 'package:short/src/feature/shared/presentation/system/_barrel.dart';

Future<void> entryDevelopment() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  await foregroundBootstrapAsync();

  Log.d(
    '\nDetected Platform is ${CurrentPlatform.name}.\n'
    'Launch Mode is ${LaunchMode.instance.name} \n',
  );

  runApp(const WantShortMaterialApp());
}
