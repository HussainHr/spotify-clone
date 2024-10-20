import '../../../../core/usecases/usecase.dart';
import '../../../../service_locator.dart';
import '../../repository/songs/songs_repository.dart';

class IsFavoriteSongUseCase implements UseCase<bool,String> {
  @override
  Future<bool> call({String ? params}) async {
    return await sl<SongRepository>().isFavoriteSong(params!);
  }


}