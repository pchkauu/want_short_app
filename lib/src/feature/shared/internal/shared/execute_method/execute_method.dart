import 'dart:async';

import 'package:short/src/core/_barrel.dart';
import 'package:short/src/feature/shared/internal/shared/_barrel.dart';
import 'package:either_dart/either.dart';

Future<Either<Failure, T>> executeMethod<T>(
  Future<T> Function() methodLogic, {
  required FailureType failureType,
  bool saveLog = true,
}) async {
  try {
    return Right(await methodLogic());
  } on Failure catch (failure) {
    await Log.w(
      failure.key.message,
      exception: failure,
      stackTrace: failure.stackTrace,
      saveLog: saveLog,
    );

    return Left(failure);
  } on Object catch (error, stackTrace) {
    await Log.f(
      error,
      stackTrace: stackTrace,
      saveLog: saveLog,
    );

    switch (failureType) {
      case FailureType.local:
        {
          final localFailure = LocalFailure(
            error: error,
            stackTrace: stackTrace,
            key: const LocalCritical(),
          );

          return Left(localFailure);
        }
      case FailureType.remote:
        {
          final remoteFailure = RemoteFailure(
            error: error,
            stackTrace: stackTrace,
            key: const RemoteCritical(),
          );

          return Left(remoteFailure);
        }
    }
  }
}

Either<Failure, T> executeMethodSync<T>(
  T Function() methodLogic, {
  required FailureType failureType,
  bool saveLog = true,
}) {
  try {
    return Right(methodLogic());
  } on Failure catch (failure) {
    unawaited(
      Log.w(
        failure.key.message,
        exception: failure,
        stackTrace: failure.stackTrace,
        saveLog: saveLog,
      ),
    );

    return Left(failure);
  } on Object catch (error, stackTrace) {
    unawaited(
      Log.f(
        error,
        stackTrace: stackTrace,
        saveLog: saveLog,
      ),
    );

    switch (failureType) {
      case FailureType.local:
        {
          final localFailure = LocalFailure(
            error: error,
            stackTrace: stackTrace,
            key: const LocalCritical(),
          );

          return Left(localFailure);
        }
      case FailureType.remote:
        {
          final remoteFailure = RemoteFailure(
            error: error,
            stackTrace: stackTrace,
            key: const RemoteCritical(),
          );

          return Left(remoteFailure);
        }
    }
  }
}
