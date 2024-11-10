part of 'failure.dart';

class LocalFailure extends Failure {
  @override
  // ignore: overridden_fields
  final LocalFailureKey key;

  const LocalFailure({
    required this.key,
    super.error,
    super.stackTrace,
  }) : super(key: key);

  @override
  List<Object?> get props => [
        key,
      ];
}

sealed class LocalFailureKey extends FailureKey {
  const LocalFailureKey({
    super.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

final class LocalIOError extends LocalFailureKey {
  const LocalIOError({
    super.message = 'failure.local.ioerror',
  });

  @override
  String toString() {
    return 'failure.local.ioerror';
  }
}

final class LocalNoInternetConnection extends LocalFailureKey {
  const LocalNoInternetConnection({
    super.message = 'failure.local.no_connection',
  });

  @override
  String toString() {
    return 'failure.local.no_connection';
  }
}

final class LocalRulesUnfollowed extends LocalFailureKey {
  const LocalRulesUnfollowed({
    super.message = 'failure.local.rules_unfollowed',
  });

  @override
  String toString() {
    return 'failure.local.rules_unfollowed';
  }
}

final class LocalUnexpectedNullValue extends LocalFailureKey {
  const LocalUnexpectedNullValue({
    super.message = 'failure.local.unexpected_null_value',
  });

  @override
  String toString() {
    return 'failure.local.unexpected_null_value';
  }
}

final class LocalNotificationError extends LocalFailureKey {
  const LocalNotificationError({
    super.message = 'failure.local.notification',
  });

  @override
  String toString() {
    return 'failure.local.notification';
  }
}

final class LocalUnsupportedAppVersion extends LocalFailureKey {
  const LocalUnsupportedAppVersion({
    super.message = 'failure.local.unsupported_app_version',
  });

  @override
  String toString() {
    return 'failure.local.unsuppored_app_version';
  }
}

final class LocalCritical extends LocalFailureKey {
  const LocalCritical({
    super.message = 'failure.local.critical',
  });

  @override
  String toString() {
    return 'failure.local.critical';
  }
}
