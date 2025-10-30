import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/core/config/env/env.dart';
import 'package:vibra/core/network/interceptors/auth_interceptor.dart';

@module
abstract class NetworkModule {
  @LazySingleton()
  ChopperClient provideChopperClient(AuthInterceptor authInterceptor) {
    return ChopperClient(
      converter: JsonConverter(),
      interceptors: [authInterceptor],
      baseUrl: Uri.parse(Env.spotifyApiUrl),
    );
  }
}
