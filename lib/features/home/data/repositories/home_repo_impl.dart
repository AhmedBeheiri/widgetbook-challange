import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/error/failures.dart';
import 'package:widgetbook_challenge/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:widgetbook_challenge/features/home/domain/repositories/home_repo.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  /// Home Repo Impl Constructor.
  const HomeRepoImpl({
    required HomeRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final HomeRemoteDataSource _remoteDataSource;

  @override
  Future<Either<Failure, String>> getWelcomeMessage(String name) async {
    try {
      return Right(await _remoteDataSource.getWelcomeMessage(name));
    } on UnexpectedException catch (e) {
      return const Left(UnexpectedFailure(errorMessage: 'Unexpected Error'));
    }
  }
}
