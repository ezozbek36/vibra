import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/core/errors/failure.dart';
import 'package:vibra/features/auth/domain/entities/token.dart';
import 'package:vibra/features/auth/domain/repositories/auth_repository.dart';

@lazySingleton
class AuthorizeUserUseCase {
  final AuthRepository _repository;

  const AuthorizeUserUseCase(this._repository);

  Future<Either<Failure, Token>> call() async => await _repository.authorize();
}
