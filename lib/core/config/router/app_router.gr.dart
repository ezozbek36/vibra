// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:vibra/features/album/presentation/screens/album_screen.dart'
    as _i1;
import 'package:vibra/features/auth/presentation/screens/login_screen.dart'
    as _i3;
import 'package:vibra/features/home/presentation/screens/home_screen.dart'
    as _i2;

/// generated route for
/// [_i1.AlbumScreen]
class AlbumRoute extends _i4.PageRouteInfo<AlbumRouteArgs> {
  AlbumRoute({
    _i5.Key? key,
    required String albumId,
    required String albumTitle,
    List<_i4.PageRouteInfo>? children,
  }) : super(
         AlbumRoute.name,
         args: AlbumRouteArgs(
           key: key,
           albumId: albumId,
           albumTitle: albumTitle,
         ),
         rawPathParams: {'id': albumId, 'title': albumTitle},
         initialChildren: children,
       );

  static const String name = 'AlbumRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<AlbumRouteArgs>(
        orElse: () => AlbumRouteArgs(
          albumId: pathParams.getString('id'),
          albumTitle: pathParams.getString('title'),
        ),
      );
      return _i1.AlbumScreen(
        key: args.key,
        albumId: args.albumId,
        albumTitle: args.albumTitle,
      );
    },
  );
}

class AlbumRouteArgs {
  const AlbumRouteArgs({
    this.key,
    required this.albumId,
    required this.albumTitle,
  });

  final _i5.Key? key;

  final String albumId;

  final String albumTitle;

  @override
  String toString() {
    return 'AlbumRouteArgs{key: $key, albumId: $albumId, albumTitle: $albumTitle}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AlbumRouteArgs) return false;
    return key == other.key &&
        albumId == other.albumId &&
        albumTitle == other.albumTitle;
  }

  @override
  int get hashCode => key.hashCode ^ albumId.hashCode ^ albumTitle.hashCode;
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginScreen();
    },
  );
}
