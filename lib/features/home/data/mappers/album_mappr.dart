import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:vibra/features/home/data/mappers/album_mappr.auto_mappr.dart';
import 'package:vibra/features/home/data/models/album_model.dart';
import 'package:vibra/features/home/domain/entities/album.dart';

@LazySingleton()
@AutoMappr([
  MapType<AlbumModel, Album>(
    fields: [
      Field('title', from: 'name'),
      Field('coverUrl', custom: AlbumMappr.mapCoverUrl),
      Field('artists', custom: AlbumMappr.mapArtists),
    ],
  ),
])
class AlbumMappr extends $AlbumMappr {
  static String mapCoverUrl(AlbumModel album) => album.images.first.url;
  static List<String> mapArtists(AlbumModel album) => album.artists.map((artist) => artist.name).toList();
}
