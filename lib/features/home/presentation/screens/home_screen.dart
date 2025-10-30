import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibra/features/home/presentation/providers/album_provider.dart';
import 'package:vibra/features/home/presentation/widgets/album_list_shimmer.dart';
import 'package:vibra/features/home/presentation/widgets/album_list_view.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumsAsync = ref.watch(albumProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Vibra – New Releases'),
        centerTitle: true,
      ),
      body: albumsAsync.when(
        loading: () => AlbumListShimmer(),
        error: (error, _) => Center(child: Text('Error: $error')),
        data: (either) => either.match(
          (failure) => Center(child: Text('Error: ${failure.message}')),
          (albums) => AlbumListView(albums: albums),
        ),
      ),
    );
  }
}
