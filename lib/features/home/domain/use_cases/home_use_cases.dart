import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:widgetbook_challenge/core/error/failures.dart';
import 'package:widgetbook_challenge/features/home/domain/repositories/home_repo.dart';

/// Home Use Cases Layer.
@lazySingleton
class HomeUseCases {
  /// Home Use Cases Constructor.
  const HomeUseCases({
    required HomeRepo repo,
  }) : _repo = repo;
  final HomeRepo _repo;

  /// Fetches the Welcome Message or [Failure] given the [name].
  Future<Either<Failure, String>> getWelcomeMessage(String name) async =>
      _repo.getWelcomeMessage(name);
}
