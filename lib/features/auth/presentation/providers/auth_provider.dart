import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibra/core/config/di/injection.dart';
import 'package:vibra/features/auth/domain/entities/token.dart';
import 'package:vibra/features/auth/domain/usecases/authorize_user_usecase.dart';
import 'package:vibra/features/auth/domain/usecases/get_token_usecase.dart';
import 'package:vibra/features/auth/domain/usecases/logout_usecase.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  late final _getTokenUseCase = getIt<GetTokenUseCase>();
  late final _authorizeUserUseCase = getIt<AuthorizeUserUseCase>();
  late final _logoutUseCase = getIt<LogoutUseCase>();

  @override
  FutureOr<Token?> build() async {
    final either = await _getTokenUseCase();

    return either.fold((_) => null, (token) => token);
  }

  Future<void> login() async {
    final result = await _authorizeUserUseCase();

    result.match(
      (_) {},
      (token) => state = AsyncData(token),
    );
  }

  Future<void> logout() async {
    await _logoutUseCase();

    state = AsyncData(null);
  }
}
