import 'package:get_it/get_it.dart';
import 'package:spotify_clone_flutter/data/ripository/auth/auth_repository_impl.dart';
import 'package:spotify_clone_flutter/data/ripository/song/songs_repository_impl.dart';
import 'package:spotify_clone_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_flutter/data/sources/songs/songs_firebase_service.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/auth/auth_repository.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/songs/songs_repository.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/auth/sign_in.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/auth/sign_up.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/songs/add_or_remove_favorite.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/songs/get_favorite_song.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/songs/get_news_songs.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/songs/get_play_list.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/songs/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  
  sl.registerSingleton<SongsFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  
  sl.registerSingleton<SongRepository>(SongsRepositoryImpl());
  
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());

  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  
  sl.registerSingleton<GetNewsSongsUseCase>(GetNewsSongsUseCase());
  
  sl.registerSingleton<GetPlayListUseCase>(GetPlayListUseCase());
  
  sl.registerSingleton<GetFavoriteSongsUseCase>(GetFavoriteSongsUseCase());
  
  sl.registerSingleton<AddOrRemoveFavoriteUseCase>(AddOrRemoveFavoriteUseCase());
  
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
  
}