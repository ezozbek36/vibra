import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/core/errors/failure.dart';
import 'package:vibra/features/home/data/datasources/remote/spotify_remote_data_source.dart';
import 'package:vibra/features/home/data/mappers/album_mappr.dart';
import 'package:vibra/features/home/data/models/album_model.dart';
import 'package:vibra/features/home/domain/repositories/album_repository.dart';
import 'package:vibra/shared/domain/entities/album.dart';

@LazySingleton(as: AlbumRepository)
class AlbumRepositoryImpl implements AlbumRepository {
  final SpotifyRemoteDataSource _spotifyRemoteDataSource;
  final AlbumMappr _mappr;

  const AlbumRepositoryImpl(this._spotifyRemoteDataSource, this._mappr);

  @override
  Future<Either<Failure, List<Album>>> getNewReleases() async {
    try {
      final result = await _spotifyRemoteDataSource.getNewReleases();

      final albums = result['albums']?['items'] as List?;

      if (albums == null || albums.isEmpty) return right([]);

      final models = albums.map((a) => AlbumModel.fromJson(a));
      final entities = _mappr.convertList<AlbumModel, Album>(models);

      return right(entities);
    } on ChopperHttpException catch (error) {
      return left(ServerFailure(error.toString(), error));
    } on Exception catch (error) {
      return left(NetworkFailure(error.toString(), error));
    } catch (error) {
      return left(UnexpectedFailure('Unexpected error: ${error.toString()}', error));
    }
  }
}
