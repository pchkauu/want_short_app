// ignore_for_file: avoid_annotating_with_dynamic

import 'package:short/src/core/_barrel.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class Log {
  static Talker talker = Talker(
    logger: TalkerLogger(),
    settings: TalkerSettings(
      maxHistoryItems: 3000,
    ),
    filter: BaseTalkerFilter(),
  );

  Log._();

  static void init() {
    talker = TalkerFlutter.init(
      logger: TalkerLogger(),
      settings: TalkerSettings(
        maxHistoryItems: 3000,
      ),
      filter: BaseTalkerFilter(),
    );

    // if (FlavorManager.isProd) return;

    LogSpecific.init();
  }

  static void d(
    dynamic msg, {
    Object? exception,
    StackTrace? stackTrace,
    bool saveLog = true,
  }) {
    if (FlavorManager.isProd) return;

    talker.debug(
      msg,
      exception,
      stackTrace,
    );
  }

  static Future<void> f(
    Object exception, {
    StackTrace? stackTrace,
    dynamic msg,
    bool saveLog = true,
  }) async {
    if (saveLog) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    // if (FlavorManager.isProd) return;

    talker.handle(
      exception,
      stackTrace,
      msg,
    );
  }

  static Future<void> w(
    dynamic msg, {
    Object? exception,
    StackTrace? stackTrace,
    bool saveLog = true,
  }) async {
    if (saveLog) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    // if (FlavorManager.isProd) return;

    talker.warning(
      msg,
      exception,
      stackTrace,
    );
  }

  static Future<void> handleGlobal(
    Object exception,
    StackTrace? stackTrace, {
    bool saveLog = true,
  }) async {
    if (saveLog) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    // if (FlavorManager.isProd) return;

    talker.handle(
      exception,
      stackTrace,
      'Catched In Global Zone',
    );
  }

  static Future<void> handleGlobalBackground(
    Object exception,
    StackTrace? stackTrace, {
    bool saveLog = true,
  }) async {
    if (saveLog) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    // if (FlavorManager.isProd) return;

    talker.handle(
      exception,
      stackTrace,
      'Catched In Global Background Zone',
    );
  }
}
