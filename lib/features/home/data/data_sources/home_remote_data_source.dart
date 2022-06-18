import 'package:injectable/injectable.dart';
import 'package:widgetbook_challenge/api/widgetbook_api.dart';
import 'package:widgetbook_challenge/core/error/exception.dart';

/// Home Remote Data Source contract.
abstract class HomeRemoteDataSource {
  /// Fetches the Welcome Message given the [name].
  Future<String> getWelcomeMessage(String name);
}

/// Home Remote Data Source implementation.
@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final WidgetbookApi _api = WidgetbookApi();

  @override
  Future<String> getWelcomeMessage(String name) async {
    return _api.welcomeToWidgetbook(message: name);
  }
}
