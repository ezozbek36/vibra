import 'package:equatable/equatable.dart';

class Album extends Equatable {
  final String id;
  final String title;
  final List<String> artists;
  final String coverUrl;
  final String releaseDate;
  final int totalTracks;

  const Album({
    required this.id,
    required this.title,
    required this.artists,
    required this.coverUrl,
    required this.releaseDate,
    required this.totalTracks,
  });

  @override
  List<Object?> get props => [id, title, artists];
}
