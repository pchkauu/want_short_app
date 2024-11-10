part of 'failure.dart';

class RemoteFailure extends Failure {
  @override
  // ignore: overridden_fields
  final RemoteFailureKey key;

  const RemoteFailure({
    required this.key,
    super.error,
    super.stackTrace,
  }) : super(key: key);

  @override
  List<Object?> get props => [
        key,
      ];
}

sealed class RemoteFailureKey extends FailureKey {
  final Object? data;
  final int? statusCode;

  const RemoteFailureKey({
    super.message,
    this.data,
    this.statusCode,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

final class RemoteInvalidToken extends RemoteFailureKey {
  const RemoteInvalidToken({
    required super.statusCode,
    required super.data,
    super.message = 'Невалидный токен',
  });

  @override
  String toString() {
    return 'Невалидный токен';
  }
}

final class RemoteBadRequest extends RemoteFailureKey {
  const RemoteBadRequest({
    required super.data,
    super.message = 'Ошибка при запросе данных',
    super.statusCode = 400,
  });

  @override
  String toString() {
    return 'Ошибка при запросе данных';
  }
}

final class RemoteUnauthorized extends RemoteFailureKey {
  const RemoteUnauthorized({
    required super.data,
    super.message = 'Невалидный токен',
    super.statusCode = 401,
  });

  @override
  String toString() {
    return 'Невалидный токен';
  }
}

final class RemoteForbidden extends RemoteFailureKey {
  const RemoteForbidden({
    required super.data,
    super.message = 'Доступ запрещен',
    super.statusCode = 403,
  });

  @override
  String toString() {
    return 'Доступ запрещен';
  }
}

final class RemoteNotFound extends RemoteFailureKey {
  const RemoteNotFound({
    required super.data,
    super.message = 'Не найдено',
    super.statusCode = 404,
  });

  @override
  String toString() {
    return 'Не найдено';
  }
}

final class InternalServerError extends RemoteFailureKey {
  const InternalServerError({
    required super.data,
    super.message = 'Критическая ошибка сервера',
    super.statusCode = 500,
  });

  @override
  String toString() {
    return 'Критическая ошибка сервера';
  }
}

final class Timeout extends RemoteFailureKey {
  const Timeout({
    super.message = 'Время истекло',
    super.statusCode,
  });

  @override
  String toString() {
    return 'Время истекло';
  }
}

final class UnexpectedStatusCode extends RemoteFailureKey {
  const UnexpectedStatusCode({
    required super.statusCode,
    required super.data,
    super.message = 'failure.remote.unexpected_status_code',
  });

  @override
  String toString() {
    return 'failure.remote.critical';
  }
}

final class RemoteCritical extends RemoteFailureKey {
  const RemoteCritical({
    super.message = 'Критическая ошибка',
    super.statusCode,
    super.data,
  });

  @override
  String toString() {
    return 'Критическая ошибка';
  }
}
