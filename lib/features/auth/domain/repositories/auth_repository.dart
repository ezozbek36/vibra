import 'package:fpdart/fpdart.dart';
import 'package:vibra/core/errors/failure.dart';
import 'package:vibra/features/auth/domain/entities/token.dart';

abstract class AuthRepository {
  Future<Either<Failure, Token>> authorize();
  Future<Either<Failure, Token?>> getStoredToken();
  Future<void> logout();
}
