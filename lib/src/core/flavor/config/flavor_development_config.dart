import 'package:short/src/core/_barrel.dart';

class FlavorDevelopmentConfig extends FlavorTypeConfig {
  const FlavorDevelopmentConfig();

  /// Trader Device API
  @override
  String get baseUrl => '';

  /// Sentry
  @override
  String get sentryDsn => '';
}
