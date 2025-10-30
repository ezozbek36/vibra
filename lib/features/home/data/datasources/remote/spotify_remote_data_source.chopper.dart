// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_remote_data_source.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$SpotifyRemoteDataSource extends SpotifyRemoteDataSource {
  _$SpotifyRemoteDataSource([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = SpotifyRemoteDataSource;

  @override
  Future<Map<String, dynamic>> getNewReleases() async {
    final Uri $url = Uri.parse('/browse/new-releases?limit=10');
    final Request $request = Request('GET', $url, client.baseUrl);
    final Response $response = await client
        .send<Map<String, dynamic>, Map<String, dynamic>>($request);
    return $response.bodyOrThrow;
  }
}
