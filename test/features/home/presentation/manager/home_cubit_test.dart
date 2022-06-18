import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:widgetbook_challenge/core/error/failures.dart';
import 'package:widgetbook_challenge/features/home/domain/use_cases/home_use_cases.dart';
import 'package:widgetbook_challenge/features/home/presentation/manager/home_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'home_cubit_test.mocks.dart';

@GenerateMocks([HomeUseCases])
void main() {
  final homeUseCases = MockHomeUseCases();
  final homeCubit = HomeCubit(homeUseCases: homeUseCases);
  test('initialState should be Empty', () {
    expect(homeCubit.state, equals(HomeInitial()));
  });

  group('get Welcome Message', () {
    const tName = 'Test';
    const tWelcomeMessage = 'Welcome $tName';
    test('should get data from the home use case', () async {
      when(homeUseCases.getWelcomeMessage(any))
          .thenAnswer((_) async => const Right(tWelcomeMessage));
      await homeCubit.getWelcomeMessage(tName);
      await untilCalled(homeUseCases.getWelcomeMessage(any));
      verify(homeUseCases.getWelcomeMessage(tName));
    });
    blocTest<HomeCubit, HomeState>(
      'emits [LoadingState, LoadedState] when successful',
      build: () => HomeCubit(homeUseCases: homeUseCases),
      act: (HomeCubit cubit) {
        when(homeUseCases.getWelcomeMessage(any))
            .thenAnswer((_) async => const Right(tWelcomeMessage));
        cubit.getWelcomeMessage(tName);
      },
      expect: () => [
        LoadingState(),
        LoadedState(tWelcomeMessage),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [LoadingState, ErrorState] when  getting data fails',
      build: () => HomeCubit(homeUseCases: homeUseCases),
      act: (HomeCubit cubit) {
        when(homeUseCases.getWelcomeMessage(any)).thenAnswer(
          (_) async => const Left(
            UnexpectedFailure(errorMessage: 'Unexpected Error'),
          ),
        );
        cubit.getWelcomeMessage(tName);
      },
      expect: () => [
        LoadingState(),
        ErrorState('Unexpected Error'),
      ],
    );
  });
}
