import 'package:connecteo/connecteo.dart';

final connecteo = ConnectionChecker();

abstract class NetworkHelper {
  const NetworkHelper._();

  /// Check If Network Enabled
  static Future<bool> isConnected() async => connecteo.isConnected;
}
