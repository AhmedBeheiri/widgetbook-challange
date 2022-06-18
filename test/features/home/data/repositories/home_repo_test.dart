import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/error/failures.dart';
import 'package:widgetbook_challenge/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:widgetbook_challenge/features/home/data/repositories/home_repo_impl.dart';
import 'home_repo_test.mocks.dart';

@GenerateMocks([HomeRemoteDataSource])
void main() {
  final mockRemoteDataSource = MockHomeRemoteDataSource();
  final repo = HomeRepoImpl(remoteDataSource: mockRemoteDataSource);
  group('get welcome Message', () {
    const tName = 'Test';
    const tWelcomeMessage = 'Welcome $tName';
    const tWelcomeMessageReturned = tWelcomeMessage;
    test(
        'should return remote data when the call to remote data source is successful',
        () async {
      when(mockRemoteDataSource.getWelcomeMessage(tName))
          .thenAnswer((_)async => tWelcomeMessage);
      final result = await repo.getWelcomeMessage(tName);
      verify(mockRemoteDataSource.getWelcomeMessage(tName));
      expect(
        result,
        equals(
          const Right<Failure, String>(tWelcomeMessageReturned),
        ),
      );
    });

    test(
        'should return Unexpected failure when the call to remote data source '
        'is unsuccessful', () async {
      when(mockRemoteDataSource.getWelcomeMessage(tName))
          .thenThrow(UnexpectedException());
      final result = await repo.getWelcomeMessage(tName);
      verify(mockRemoteDataSource.getWelcomeMessage(tName));
      expect(
        result,
        equals(
          const Left<Failure, String>(
            UnexpectedFailure(errorMessage: 'Unexpected Error'),
          ),
        ),
      );
    });
  });
}
