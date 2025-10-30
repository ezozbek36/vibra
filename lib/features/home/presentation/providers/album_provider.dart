import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vibra/core/config/di/injection.dart';
import 'package:vibra/core/errors/failure.dart';
import 'package:vibra/features/home/domain/entities/album.dart';
import 'package:vibra/features/home/domain/usecases/get_new_albums_usecase.dart';

part 'album_provider.g.dart';

@riverpod
Future<Either<Failure, List<Album>>> album(Ref ref) async {
  final useCase = getIt<GetNewAlbumsUseCase>();

  return await useCase.call();
}
