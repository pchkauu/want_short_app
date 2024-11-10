import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:short/src/core/_barrel.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final _bootstrapSteps = [
  _initEquatable,
  // initService,
  configureDependencies,
  _platformSetup,
];

bool _bootstrapCompleted = false;

Stream<double> foregroundBootstrap(
  Completer<void>? completer,
) async* {
  Log.d('Step:before');

  if (_bootstrapCompleted) {
    return;
  }
  Log.d('Step:i');

  await CurrentPlatform.instance.init();

  await LaunchMode.instance.setAppState(
    AppState.foreground,
  );

  final stepLength = _bootstrapSteps.length - 1;

  for (var i = 0; i < _bootstrapSteps.length; i++) {
    await _bootstrapSteps[i]();
    Log.d('Step: $i');

    yield i / stepLength * 100;
  }

  _bootstrapCompleted = true;

  completer?.complete();
  return;
}

Future<void> foregroundBootstrapAsync() async {
  Log.d('Step:before');

  if (_bootstrapCompleted) {
    return;
  }

  Log.d('Step:i');

  await CurrentPlatform.instance.init();

  await LaunchMode.instance.setAppState(
    AppState.foreground,
  );

  for (var i = 0; i < _bootstrapSteps.length; i++) {
    await _bootstrapSteps[i]();
    Log.d('Step: $i');
  }

  _bootstrapCompleted = true;

  return;
}

Future<void> backgroundBootstrap() async {
  if (_bootstrapCompleted) return;

  await LaunchMode.instance.setAppState(
    AppState.background,
  );

  for (var i = 0; i < _bootstrapSteps.length; i++) {
    await _bootstrapSteps[i]();
  }

  _bootstrapCompleted = true;
}

Future<void> isolateBootstrap({
  required FlavorTypeConfig flavorConfig,
}) async {
  if (_bootstrapCompleted) return;

  FlavorManager.config = flavorConfig;

  await LaunchMode.instance.setAppState(
    AppState.isolate,
  );

  for (var i = 0; i < _bootstrapSteps.length; i++) {
    await _bootstrapSteps[i]();
  }

  _bootstrapCompleted = true;
}

Future<void> _platformSetup() async {
  if (LaunchMode.instance.notForeground) return;

  if (CurrentPlatform.instance.isMobile) {
    await _mobileSetup();

    return;
  }

  if (CurrentPlatform.instance.isDesktop) {
    await _desktopSetup();

    return;
  }
}

Future<void> _mobileSetup() async {
  if (LaunchMode.instance.notForeground) return;

  await WakelockPlus.enable();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

Future<void> _desktopSetup() async {
  // await windowManager.ensureInitialized();

  // const windowOptions = WindowOptions(
  //   center: true,
  //   title: AppConstant.appName,
  // );

  // await windowManager.waitUntilReadyToShow(
  //   windowOptions,
  //   () async {
  //     await windowManager.show();
  //     await windowManager.focus();
  //   },
  // );
}

Future<void> _initEquatable() async {
  EquatableConfig.stringify = true;
}
