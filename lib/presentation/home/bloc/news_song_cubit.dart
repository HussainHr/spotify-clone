import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_flutter/domain/entities/songs/songs.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/songs/get_news_songs.dart';
import '../../../service_locator.dart';
part 'news_song_state.dart';

class NewsSongCubit extends Cubit<NewsSongState> {
  NewsSongCubit() : super(NewsSongLoading());

  Future<void> getNewsSongs() async {
    emit(NewsSongLoading());
    var returnedSons = await sl<GetNewsSongsUseCase>().call();
    returnedSons.fold(
      (l) {
        emit(NewsSongsLoadFailure(l.message));
      },
      (data) {
        emit(NewsSongLoaded(songs: data));
      },
    );
  }
}
