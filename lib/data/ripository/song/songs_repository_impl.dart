import 'package:dartz/dartz.dart';
import 'package:spotify_clone_flutter/data/sources/songs/songs_firebase_service.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/songs/songs_repository.dart';
import '../../../service_locator.dart';

class SongsRepositoryImpl extends SongRepository{
  @override
  Future<Either> getNewsSong() async {
    return await sl<SongsFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongsFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async{
    return await sl<SongsFirebaseService>().addOrRemoveFavoriteSongs(songId); 
  }

  @override
  Future<Either> getUserFavoriteSongs() async{
    return await sl<SongsFirebaseService>().getUserFavoriteSongs();
  }

  @override
  Future<bool> isFavoriteSong(String songId) async{
    return await sl<SongsFirebaseService>().isFavoriteSong(songId); 
  }
}