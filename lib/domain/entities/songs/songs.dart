import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artists;
  final num duration;
  final Timestamp releasedate;
  final bool isFavorite;
  final String songId;

  SongEntity({
    required this.title,
    required this.artists,
    required this.duration,
    required this.releasedate,
    required this.isFavorite,
    required this.songId,
  });
}
