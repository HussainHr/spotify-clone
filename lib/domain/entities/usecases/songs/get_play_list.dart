import 'package:dartz/dartz.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../../service_locator.dart';
import '../../repository/songs/songs_repository.dart';

class GetPlayListUseCase implements UseCase<Either,dynamic> {

  @override
  Future<Either> call({params}) async{
    return await sl<SongRepository>().getPlayList(); 
  }
}