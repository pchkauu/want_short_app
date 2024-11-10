// ignore_for_file: constant_identifier_names

import 'dart:io';

import 'package:short/src/core/_barrel.dart';
import 'package:flutter/foundation.dart';

class CurrentPlatform {
  late final DetectedPlatform detected;

  bool _isInit = false;
  static final CurrentPlatform _instance = CurrentPlatform._internal();

  CurrentPlatform._internal();

  factory CurrentPlatform() {
    return _instance;
  }

  static CurrentPlatform get instance => _instance;

  static String get name {
    return _instance.detected.name;
  }

  bool get isInit => _isInit;

  Future<CurrentPlatform> init() async {
    if (_isInit) return _instance;

    detected = await _detectPlatform();

    _isInit = true;

    return _instance;
  }

  Future<DetectedPlatform> _detectPlatform() async {
    if (Platform.isAndroid) {
      final isPhysical = await DeviceHelper.isPhysical();

      if (isPhysical) {
        return DetectedPlatform.android;
      }

      return DetectedPlatform.android_emulator;
    }

    if (Platform.isIOS) {
      final isPhysical = await DeviceHelper.isPhysical();

      if (isPhysical) {
        return DetectedPlatform.ios;
      }

      return DetectedPlatform.ios_simulator;
    }

    if (Platform.isMacOS) {
      return DetectedPlatform.macos;
    }

    if (Platform.isWindows) {
      return DetectedPlatform.windows;
    }

    if (Platform.isLinux) {
      return DetectedPlatform.linux;
    }

    if (kIsWeb) {
      return DetectedPlatform.web;
    }

    return DetectedPlatform.unknown;
  }

  bool get isMobile {
    if (!_isInit) return false;

    return detected == DetectedPlatform.android ||
        detected == DetectedPlatform.ios;
  }

  bool get isAndroid {
    return detected == DetectedPlatform.android ||
        detected == DetectedPlatform.android_emulator;
  }

  bool get isDesktop {
    if (!_isInit) return false;

    return detected == DetectedPlatform.macos ||
        detected == DetectedPlatform.linux ||
        detected == DetectedPlatform.windows;
  }

  bool get isEmulator {
    if (!_isInit) return false;

    return detected == DetectedPlatform.android_emulator ||
        detected == DetectedPlatform.ios_simulator;
  }

  bool get notEmulator {
    if (!_isInit) return false;

    final isMobile = detected == DetectedPlatform.android ||
        detected == DetectedPlatform.ios;
    final isEmulator = detected != DetectedPlatform.android_emulator ||
        detected != DetectedPlatform.ios_simulator;

    return isMobile && isEmulator;
  }

  bool get productionFordbidden {
    return isEmulator || detected == DetectedPlatform.unknown;
  }

  bool get isUnknown {
    return detected == DetectedPlatform.unknown;
  }
}

enum DetectedPlatform {
  android,
  android_emulator,
  ios,
  ios_simulator,
  macos,
  windows,
  linux,
  web,
  unknown,
}
