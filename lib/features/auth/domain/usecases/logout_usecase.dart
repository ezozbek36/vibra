import 'package:injectable/injectable.dart';
import 'package:vibra/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class LogoutUseCase {
  final AuthRepository _repository;

  const LogoutUseCase(this._repository);

  Future<void> call() => _repository.logout();
}
