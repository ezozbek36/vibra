import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/core/auth/auth_holder.dart';
import 'package:vibra/core/errors/failure.dart';
import 'package:vibra/features/auth/data/datasources/remote/spotify_auth_remote_data_source.dart';
import 'package:vibra/features/auth/domain/entities/token.dart';
import 'package:vibra/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthHolder _authHolder;
  final SpotifyAuthRemoteDataSource _remote;

  const AuthRepositoryImpl(this._remote, this._authHolder);

  @override
  Future<Either<Failure, Token>> authorize() async {
    try {
      final data = await _remote.authorize();
      final token = Token(
        accessToken: data['access_token'],
        refreshToken: data['refresh_token'] ?? '',
        expiresAt: DateTime.now().add(Duration(seconds: data['expires_in'] ?? 3600)),
      );

      await _authHolder.saveTokens((accessToken: token.accessToken, refreshToken: token.refreshToken, expiresAt: token.expiresAt));

      return right(token);
    } catch (e) {
      return left(UnexpectedFailure(e.toString(), e));
    }
  }

  @override
  Future<Either<Failure, Token?>> getStoredToken() async {
    try {
      final stored = _authHolder.token;

      if (stored == null) return right(null);

      return right(
        Token(
          accessToken: stored.accessToken,
          refreshToken: stored.refreshToken,
          expiresAt: stored.expiresAt,
        ),
      );
    } catch (e) {
      return left(UnexpectedFailure(e.toString(), e));
    }
  }

  @override
  Future<void> logout() async => await _authHolder.clear();
}
