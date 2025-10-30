import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AlbumScreen extends StatelessWidget {
  final String albumId;
  final String albumTitle;

  const AlbumScreen({super.key, @PathParam('id') required this.albumId, @PathParam('title') required this.albumTitle});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
