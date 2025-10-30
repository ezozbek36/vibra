// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(album)
const albumProvider = AlbumProvider._();

final class AlbumProvider
    extends
        $FunctionalProvider<
          AsyncValue<Either<Failure, List<Album>>>,
          Either<Failure, List<Album>>,
          FutureOr<Either<Failure, List<Album>>>
        >
    with
        $FutureModifier<Either<Failure, List<Album>>>,
        $FutureProvider<Either<Failure, List<Album>>> {
  const AlbumProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'albumProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$albumHash();

  @$internal
  @override
  $FutureProviderElement<Either<Failure, List<Album>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Either<Failure, List<Album>>> create(Ref ref) {
    return album(ref);
  }
}

String _$albumHash() => r'cc760ea16924d7837c4b29c4fc0ea733ea89295e';
