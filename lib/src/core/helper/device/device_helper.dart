import 'dart:io';

import 'package:short/src/core/log/log.dart';
import 'package:device_info_plus/device_info_plus.dart';

/// Device Helper
abstract class DeviceHelper {
  /// Защита от запуска с эмулятора в целях избежать
  /// нарушения бизнес-логики
  static Future<bool> isPhysical() async {
    final notMobile = !Platform.isAndroid && !Platform.isIOS;

    if (notMobile) return true;

    try {
      if (Platform.isAndroid) {
        return await _checkAndroidIsPhysical();
      }

      if (Platform.isIOS) {
        return _checkIosIsPhysical();
      }

      return true;
    } on Object catch (error, stackTrace) {
      await Log.f(error, stackTrace: stackTrace);

      return false;
    }
  }

  static Future<bool> _checkAndroidIsPhysical() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;

    return androidInfo.isPhysicalDevice;
  }

  static Future<bool> _checkIosIsPhysical() async {
    final iosInfo = await DeviceInfoPlugin().iosInfo;

    return iosInfo.isPhysicalDevice;
  }
}
