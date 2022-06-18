part of 'home_cubit.dart';

/// [HomeState] is the state of the [HomeCubit].
abstract class HomeState extends Equatable {}

/// The initial state of the [HomeCubit].
class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

/// The state of the [HomeCubit] when the [HomeCubit] is loading.
class LoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

/// The state of the [HomeCubit] when the [HomeCubit] has an error.
class ErrorState extends HomeState {
  /// The Error Constructor.
  ErrorState(this.message);

  /// The Error Message.
  final String message;
  @override
  List<Object> get props => [message];
}

/// The state of the [HomeCubit] when the [HomeCubit] has a welcome message.
class LoadedState extends HomeState {
  /// The Loaded Constructor.
  LoadedState(this.message);

  /// The Loaded Message.
  final String message;

  @override
  List<Object> get props => [message];
}
