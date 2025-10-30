// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumModel _$AlbumModelFromJson(Map<String, dynamic> json) => AlbumModel(
  albumType: json['album_type'] as String,
  totalTracks: (json['total_tracks'] as num).toInt(),
  availableMarkets: (json['available_markets'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  externalUrls: _$recordConvert(
    json['external_urls'],
    ($jsonValue) => (spotify: $jsonValue['spotify'] as String),
  ),
  href: json['href'] as String,
  id: json['id'] as String,
  images: (json['images'] as List<dynamic>)
      .map(
        (e) => _$recordConvert(
          e,
          ($jsonValue) => (
            height: ($jsonValue['height'] as num).toInt(),
            url: $jsonValue['url'] as String,
            width: ($jsonValue['width'] as num).toInt(),
          ),
        ),
      )
      .toList(),
  name: json['name'] as String,
  releaseDate: json['release_date'] as String,
  releaseDatePrecision: json['release_date_precision'] as String,
  restrictions: _$recordConvertNullable(
    json['restrictions'],
    ($jsonValue) => (reason: $jsonValue['reason'] as String),
  ),
  type: json['type'] as String,
  uri: json['uri'] as String,
  artists: (json['artists'] as List<dynamic>)
      .map(
        (e) => _$recordConvert(
          e,
          ($jsonValue) => (
            externalUrls: _$recordConvertNullable(
              $jsonValue['externalUrls'],
              ($jsonValue) => (spotify: $jsonValue['spotify'] as String),
            ),
            href: $jsonValue['href'] as String,
            id: $jsonValue['id'] as String,
            name: $jsonValue['name'] as String,
            type: $jsonValue['type'] as String,
            uri: $jsonValue['uri'] as String,
          ),
        ),
      )
      .toList(),
);

Map<String, dynamic> _$AlbumModelToJson(
  AlbumModel instance,
) => <String, dynamic>{
  'album_type': instance.albumType,
  'total_tracks': instance.totalTracks,
  'available_markets': instance.availableMarkets,
  'external_urls': <String, dynamic>{'spotify': instance.externalUrls.spotify},
  'href': instance.href,
  'id': instance.id,
  'images': instance.images
      .map(
        (e) => <String, dynamic>{
          'height': e.height,
          'url': e.url,
          'width': e.width,
        },
      )
      .toList(),
  'name': instance.name,
  'release_date': instance.releaseDate,
  'release_date_precision': instance.releaseDatePrecision,
  'restrictions': instance.restrictions == null
      ? null
      : <String, dynamic>{'reason': instance.restrictions!.reason},
  'type': instance.type,
  'uri': instance.uri,
  'artists': instance.artists
      .map(
        (e) => <String, dynamic>{
          'externalUrls': e.externalUrls == null
              ? null
              : <String, dynamic>{'spotify': e.externalUrls!.spotify},
          'href': e.href,
          'id': e.id,
          'name': e.name,
          'type': e.type,
          'uri': e.uri,
        },
      )
      .toList(),
};

$Rec _$recordConvert<$Rec>(Object? value, $Rec Function(Map) convert) =>
    convert(value as Map<String, dynamic>);

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) => value == null ? null : convert(value as Map<String, dynamic>);
