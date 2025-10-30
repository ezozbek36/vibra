import 'package:flutter/material.dart';
import 'package:vibra/features/home/presentation/widgets/album_card_shimmer.dart';

class AlbumListShimmer extends StatelessWidget {
  const AlbumListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const itemCount = 6;

    return ListView.builder(
      itemCount: itemCount,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      itemBuilder: (context, index) => AlbumCardShimmer(),
    );
  }
}
