import 'dart:io';

import 'package:short/src/core/_barrel.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class PermissionHelper {
  const PermissionHelper._();

  static Future<bool> ensureGranted() async {
    final platform = CurrentPlatform.instance;

    if (platform.detected == DetectedPlatform.unknown) {
      return false;
    }

    if (platform.detected == DetectedPlatform.android) {
      return PermissionHelper.ensureAndroid();
    }

    return true;
  }

  static Future<bool> ensureAndroid() async {
    final receiveSms = await Permission.sms.isGranted;
    final sendSms = await Permission.phone.isGranted;

    final ignoreBattery = await Permission.ignoreBatteryOptimizations.isGranted;

    return receiveSms && sendSms && ignoreBattery;
  }

  static Future<bool> request() async {
    final platform = CurrentPlatform.instance;

    if (platform.isUnknown) {
      return false;
    }

    if (platform.isAndroid) {
      return PermissionHelper.requestAndroid();
    }

    return true;
  }

  static Future<bool> requestAndroid() async {
    try {} on Object catch (error, stackTrace) {
      await Log.f(error, stackTrace: stackTrace);
    }

    await Permission.sms.request();
    await Permission.phone.request();
    await Permission.ignoreBatteryOptimizations.request();

    return ensureGranted();
  }

  static Future<PermissionStatus> requestFilePermission() async {
    return Permission.photos.status;
  }

  static Future<bool> checkFilePermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      final sdkInt = androidInfo.version.sdkInt;

      return sdkInt > 32
          ? (await Permission.photos.request()).isGranted
          : (await Permission.storage.request()).isGranted;
    }

    if (Platform.isIOS) {
      final status = await Permission.photos.request();
      return status.isGranted;
    }

    return true;
  }
}
