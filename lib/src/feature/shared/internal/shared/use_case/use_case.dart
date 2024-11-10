import 'package:short/src/feature/shared/internal/shared/_barrel.dart';

// ignore: one_member_abstracts
abstract class UseCase<P extends Object?, T extends Object?> {
  Result<T> call(P params);
}
