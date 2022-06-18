import 'package:dartz/dartz.dart';
import 'package:widgetbook_challenge/core/error/failures.dart';

/// Home Repository contract.
abstract class HomeRepo {
  /// Fetches the Welcome Message or [Failure] given the [name].
  Future<Either<Failure, String>> getWelcomeMessage(String name);
}
