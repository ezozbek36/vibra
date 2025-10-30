import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

part 'spotify_remote_data_source.chopper.dart';

@LazySingleton()
@ChopperApi(baseUrl: '/browse')
abstract class SpotifyRemoteDataSource extends ChopperService {
  @FactoryMethod()
  static SpotifyRemoteDataSource create(ChopperClient client) => _$SpotifyRemoteDataSource(client);

  @GET(path: '/new-releases?limit=10')
  Future<Map<String, dynamic>> getNewReleases();
}
