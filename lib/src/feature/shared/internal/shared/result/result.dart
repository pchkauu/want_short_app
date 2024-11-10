import 'package:short/src/feature/shared/internal/shared/_barrel.dart';
import 'package:either_dart/either.dart';

typedef Result<T> = Future<Either<Failure, T>>;

typedef ResultSync<T> = Either<Failure, T>;
