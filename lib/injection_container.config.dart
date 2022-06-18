// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'features/home/data/data_sources/home_remote_data_source.dart' as _i3;
import 'features/home/data/repositories/home_repo_impl.dart' as _i5;
import 'features/home/domain/repositories/home_repo.dart' as _i4;
import 'features/home/domain/use_cases/home_use_cases.dart' as _i6;
import 'features/home/presentation/manager/home_cubit.dart'
    as _i7; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.HomeRemoteDataSource>(
      () => _i3.HomeRemoteDataSourceImpl());
  gh.lazySingleton<_i4.HomeRepo>(() =>
      _i5.HomeRepoImpl(remoteDataSource: get<_i3.HomeRemoteDataSource>()));
  gh.lazySingleton<_i6.HomeUseCases>(
      () => _i6.HomeUseCases(repo: get<_i4.HomeRepo>()));
  gh.factory<_i7.HomeCubit>(
      () => _i7.HomeCubit(homeUseCases: get<_i6.HomeUseCases>()));
  return get;
}
