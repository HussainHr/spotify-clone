import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../domain/entities/songs/songs.dart';

class SongModel {
  String ? title;
  String ? artists;
  num ? duration;
  Timestamp ? releasedate;
  bool ? isFavorite;
  String ? songId;

  SongModel({
    required this.title,
    required this.artists,
    required this.duration,
    required this.releasedate,
    required this.isFavorite,
    required this.songId
  });

  SongModel.fromJson(Map<String,dynamic> data) {
    title = data['title'];
    artists = data['artists'];
    duration = data['duration'];
    releasedate = data['releasedate'];
  }
}

extension SongModelX on SongModel {

  SongEntity toEntity() {
    return SongEntity(
        title: title!,
        artists: artists!,
        duration: duration!,
        releasedate: releasedate!,
        isFavorite: isFavorite!,
        songId: songId!
    );
  }
}