import 'package:widgetbook_challenge/core/error/failures.dart';
import 'package:widgetbook_challenge/features/home/domain/repositories/home_repo.dart';
import 'package:widgetbook_challenge/features/home/domain/use_cases/home_use_cases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'home_use_cases_test.mocks.dart';

@GenerateMocks([HomeRepo])
void main() {
  final repo = MockHomeRepo();
  final homeUseCases = HomeUseCases(repo: repo);
  const tName = 'Test';
  const tMessage = 'Welcome $tName';
  test('should get past launches from repo', () async {
    when(repo.getWelcomeMessage(tName))
        .thenAnswer((_) async => const Right(tMessage));

    final result = await homeUseCases.getWelcomeMessage(tName);

    expect(result, const Right<Failure, String>(tMessage));
    verify(repo.getWelcomeMessage(tName));
    verifyNoMoreInteractions(repo);
  });
}
