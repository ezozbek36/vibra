import 'package:json_annotation/json_annotation.dart';

part 'album_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class AlbumModel {
  final String albumType;
  final int totalTracks;
  final List<String> availableMarkets;
  final ({String spotify}) externalUrls;
  final String href;
  final String id;
  final List<({String url, int width, int height})> images;
  final String name;
  final String releaseDate;
  final String releaseDatePrecision;
  final ({String reason})? restrictions;
  final String type;
  final String uri;
  final List<({({String spotify})? externalUrls, String href, String id, String name, String type, String uri})> artists;

  const AlbumModel({
    required this.albumType,
    required this.totalTracks,
    required this.availableMarkets,
    required this.externalUrls,
    required this.href,
    required this.id,
    required this.images,
    required this.name,
    required this.releaseDate,
    required this.releaseDatePrecision,
    required this.restrictions,
    required this.type,
    required this.uri,
    required this.artists,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => _$AlbumModelFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumModelToJson(this);
}
