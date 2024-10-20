import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_flutter/presentation/home/bloc/play_list_state.dart';
import '../../../domain/entities/usecases/songs/get_play_list.dart';
import '../../../service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {

  PlayListCubit() : super(PlayListLoading());

  Future < void > getPlayList() async {
    var returnedSongs = await sl< GetPlayListUseCase >().call();
    returnedSongs.fold(
            (l) {
          emit(PlayListLoadFailure());
        },
            (data) {
          emit(
              PlayListLoaded(songs: data)
          );
        }
    );
  }
}