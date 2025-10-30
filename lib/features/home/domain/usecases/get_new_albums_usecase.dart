import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/core/errors/failure.dart';
import 'package:vibra/features/home/domain/repositories/album_repository.dart';
import 'package:vibra/shared/domain/entities/album.dart';

@LazySingleton()
class GetNewAlbumsUseCase {
  final AlbumRepository _repository;

  const GetNewAlbumsUseCase(this._repository);

  Future<Either<Failure, List<Album>>> call() => _repository.getNewReleases();
}
