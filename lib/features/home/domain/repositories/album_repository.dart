import 'package:fpdart/fpdart.dart';
import 'package:vibra/core/errors/failure.dart';
import 'package:vibra/shared/domain/entities/album.dart';

abstract class AlbumRepository {
  Future<Either<Failure, List<Album>>> getNewReleases();
}
