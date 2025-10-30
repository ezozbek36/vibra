import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env', useConstantCase: true)
abstract class Env {
  @EnviedField()
  static const String spotifyClientId = _Env.spotifyClientId;

  @EnviedField()
  static const String spotifyRedirectUri = _Env.spotifyRedirectUri;

  @EnviedField()
  static const String spotifyApiUrl = _Env.spotifyApiUrl;
}
