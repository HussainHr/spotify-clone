import 'package:dartz/dartz.dart';
import 'package:spotify_clone_flutter/core/usecases/usecase.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/songs/songs_repository.dart';

import '../../../../service_locator.dart';

class AddOrRemoveFavoriteUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongRepository>().addOrRemoveFavoriteSongs(params!); 
  }
}


