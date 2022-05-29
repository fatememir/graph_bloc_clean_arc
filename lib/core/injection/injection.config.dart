// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i4;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i7;

import '../../features/authenticate/data/data_source/authenticate_remote_datasource.dart'
    as _i5;
import '../../features/authenticate/data/repositories/authenticate_repository.dart'
    as _i9;
import '../../features/authenticate/presentation/bloc/auth_bloc.dart' as _i12;
import '../../features/login/data/data_source/login_remote_datasource.dart'
    as _i6;
import '../../features/login/data/repositories/login_repository.dart' as _i10;
import '../../features/login/presentation/bloc/login_bloc.dart' as _i11;
import '../network/network_info.dart' as _i8;
import 'register_module.dart' as _i13; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  await gh.lazySingletonAsync<_i3.Box<dynamic>>(() => registerModule.openBox,
      preResolve: true);
  gh.lazySingleton<_i4.GraphQLClient>(() => registerModule.gqlClient);
  gh.factory<_i4.HttpLink>(() => registerModule.httpLink);
  gh.lazySingleton<_i5.IAuthenticateRemoteDataSource>(
      () => _i5.AuthenticateRemoteDataSource(get<_i4.GraphQLClient>()));
  gh.lazySingleton<_i6.ILoginRemoteDataSource>(
      () => _i6.LoginRemoteDataSource(get<_i4.GraphQLClient>()));
  gh.lazySingleton<_i7.InternetConnectionChecker>(
      () => registerModule.connectionChecker);
  gh.factory<_i4.Link>(() => registerModule.authLink);
  gh.lazySingleton<_i8.NetworkInfo>(
      () => _i8.NetworkInfo(get<_i7.InternetConnectionChecker>()));
  gh.lazySingleton<_i9.IAuthenticateRepository>(() =>
      _i9.AuthenticateRepository(
          get<_i8.NetworkInfo>(), get<_i5.IAuthenticateRemoteDataSource>()));
  gh.lazySingleton<_i10.ILoginRepository>(() => _i10.LoginRepository(
      get<_i8.NetworkInfo>(), get<_i6.ILoginRemoteDataSource>()));
  gh.lazySingleton<_i11.LoginBloc>(
      () => _i11.LoginBloc(loginRepository: get<_i10.ILoginRepository>()));
  gh.lazySingleton<_i12.AuthenticationBloc>(() => _i12.AuthenticationBloc(
      authenticationRepository: get<_i9.IAuthenticateRepository>()));
  return get;
}

class _$RegisterModule extends _i13.RegisterModule {}
