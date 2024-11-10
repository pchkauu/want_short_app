import 'package:short/src/core/_barrel.dart';

abstract class FlavorManager {
  static const mapKey = 'flavor';
  static const devValue = 'dev';
  static const prodValue = 'prod';

  static FlavorTypeConfig config = const FlavorDevelopmentConfig();

  const FlavorManager._();

  static bool get isDev => config is FlavorDevelopmentConfig;

  static bool get isProd => config is FlavorProductionConfig;

  static void setConfigFromString(String flavorStr) {
    if (flavorStr == devValue) {
      config = const FlavorDevelopmentConfig();
    }

    if (flavorStr == prodValue) {
      config = const FlavorProductionConfig();
    }
  }

  static String get configStr {
    return isProd ? prodValue : devValue;
  }
}
