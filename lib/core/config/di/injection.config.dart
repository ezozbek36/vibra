// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i31;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:vibra/core/auth/auth_holder.dart' as _i592;
import 'package:vibra/core/config/di/core_module.dart' as _i612;
import 'package:vibra/core/config/router/app_router.dart' as _i915;
import 'package:vibra/core/network/chopper_client.dart' as _i1061;
import 'package:vibra/core/network/interceptors/auth_interceptor.dart' as _i48;
import 'package:vibra/features/auth/data/datasources/remote/spotify_auth_remote_data_source.dart'
    as _i663;
import 'package:vibra/features/auth/data/repositories/auth_repository_impl.dart'
    as _i112;
import 'package:vibra/features/auth/domain/repositories/auth_repository.dart'
    as _i5;
import 'package:vibra/features/auth/domain/usecases/authorize_user_usecase.dart'
    as _i29;
import 'package:vibra/features/auth/domain/usecases/get_token_usecase.dart'
    as _i289;
import 'package:vibra/features/auth/domain/usecases/logout_usecase.dart'
    as _i295;
import 'package:vibra/features/home/data/datasources/remote/spotify_remote_data_source.dart'
    as _i1007;
import 'package:vibra/features/home/data/mappers/album_mappr.dart' as _i1013;
import 'package:vibra/features/home/data/repositories/album_repository_impl.dart'
    as _i448;
import 'package:vibra/features/home/domain/repositories/album_repository.dart'
    as _i641;
import 'package:vibra/features/home/domain/usecases/get_new_albums_usecase.dart'
    as _i1002;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final coreModule = _$CoreModule();
    final networkModule = _$NetworkModule();
    gh.lazySingleton<_i1013.AlbumMappr>(() => _i1013.AlbumMappr());
    gh.lazySingleton<_i663.SpotifyAuthRemoteDataSource>(
      () => _i663.SpotifyAuthRemoteDataSource(),
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => coreModule.flutterSecureStorage,
    );
    await gh.singletonAsync<_i592.AuthHolder>(
      () => _i592.AuthHolder.create(gh<_i558.FlutterSecureStorage>()),
      preResolve: true,
    );
    gh.lazySingleton<_i48.AuthInterceptor>(
      () => _i48.AuthInterceptor(gh<_i592.AuthHolder>()),
    );
    gh.singleton<_i915.AppRouter>(
      () => _i915.AppRouter(gh<_i592.AuthHolder>()),
    );
    gh.lazySingleton<_i31.ChopperClient>(
      () => networkModule.provideChopperClient(gh<_i48.AuthInterceptor>()),
    );
    gh.lazySingleton<_i5.AuthRepository>(
      () => _i112.AuthRepositoryImpl(
        gh<_i663.SpotifyAuthRemoteDataSource>(),
        gh<_i592.AuthHolder>(),
      ),
    );
    gh.lazySingleton<_i289.GetTokenUseCase>(
      () => _i289.GetTokenUseCase(gh<_i5.AuthRepository>()),
    );
    gh.lazySingleton<_i29.AuthorizeUserUseCase>(
      () => _i29.AuthorizeUserUseCase(gh<_i5.AuthRepository>()),
    );
    gh.lazySingleton<_i295.LogoutUseCase>(
      () => _i295.LogoutUseCase(gh<_i5.AuthRepository>()),
    );
    gh.lazySingleton<_i1007.SpotifyRemoteDataSource>(
      () => _i1007.SpotifyRemoteDataSource.create(gh<_i31.ChopperClient>()),
    );
    gh.lazySingleton<_i641.AlbumRepository>(
      () => _i448.AlbumRepositoryImpl(
        gh<_i1007.SpotifyRemoteDataSource>(),
        gh<_i1013.AlbumMappr>(),
      ),
    );
    gh.lazySingleton<_i1002.GetNewAlbumsUseCase>(
      () => _i1002.GetNewAlbumsUseCase(gh<_i641.AlbumRepository>()),
    );
    return this;
  }
}

class _$CoreModule extends _i612.CoreModule {}

class _$NetworkModule extends _i1061.NetworkModule {}
