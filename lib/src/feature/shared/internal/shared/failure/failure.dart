import 'package:equatable/equatable.dart';

part 'local_failure.dart';
part 'remote_failure.dart';

/// String Const Of Failure Message Body

const criticalFailurePrefix = 'Critical Failure';
const customFailurePrefix = 'Custom Failure';

enum FailureType {
  local,
  remote,
}

abstract class Failure extends Equatable implements Exception {
  final FailureKey key;
  final Object? error;
  final StackTrace? stackTrace;

  const Failure({
    required this.key,
    this.error,
    this.stackTrace,
  });
}

abstract class FailureKey extends Equatable {
  final String? message;

  const FailureKey({
    this.message,
  });
}
