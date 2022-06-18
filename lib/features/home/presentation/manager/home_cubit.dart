import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:widgetbook_challenge/core/error/failures.dart';
import 'package:widgetbook_challenge/features/home/domain/use_cases/home_use_cases.dart';

part 'home_state.dart';

/// [HomeCubit] controller.
@Injectable()
class HomeCubit extends Cubit<HomeState> {
  /// Creates a new instance of [HomeCubit].
  HomeCubit({required HomeUseCases homeUseCases})
      : _homeUseCases = homeUseCases,
        super(HomeInitial());

  final HomeUseCases _homeUseCases;

  /// Fetches the Welcome Message or [Failure] given the [name].
  Future<void> getWelcomeMessage(String name) async {
    emit(LoadingState());

    final response = await _homeUseCases.getWelcomeMessage(name);
    response.fold(
      (l) {
        if (l is UnexpectedFailure) {
          emit(ErrorState(l.errorMessage));
        }
      },
      (r) => emit(
        LoadedState(r),
      ),
    );
  }

  /// Reset To [HomeInitial] State.
  void reset() {
    emit(HomeInitial());
  }
}
