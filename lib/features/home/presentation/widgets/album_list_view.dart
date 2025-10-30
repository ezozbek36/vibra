import 'package:flutter/material.dart';
import 'package:vibra/features/home/presentation/widgets/album_card.dart';
import 'package:vibra/shared/domain/entities/album.dart';

class AlbumListView extends StatelessWidget {
  final List<Album> albums;

  const AlbumListView({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      padding: EdgeInsets.symmetric(vertical: 8),
      itemBuilder: (context, index) => AlbumCard(album: albums[index]),
    );
  }
}
