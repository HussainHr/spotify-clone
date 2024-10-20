import 'package:dartz/dartz.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/songs/songs_repository.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../service_locator.dart';

class GetFavoriteSongsUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<SongRepository>().getUserFavoriteSongs();
  }
}