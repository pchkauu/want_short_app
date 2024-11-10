import 'package:flutter/material.dart';
import 'package:short/src/core/_barrel.dart';

Future<void> entryProduction() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init();
  FlavorManager.config = const FlavorProductionConfig();

  // foregroundBootstrap();
}
