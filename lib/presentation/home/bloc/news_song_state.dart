part of 'news_song_cubit.dart';

abstract class NewsSongState {}
 
class NewsSongInitial extends NewsSongState {}
class NewsSongLoading extends NewsSongState {}

class NewsSongLoaded extends NewsSongState {
  final List<SongEntity> songs;

  NewsSongLoaded({required this.songs});
}

class NewsSongsLoadFailure extends NewsSongState{
  final String message;
  NewsSongsLoadFailure(this.message);
}
