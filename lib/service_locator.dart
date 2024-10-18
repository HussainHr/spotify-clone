import 'package:get_it/get_it.dart';
import 'package:spotify_clone_flutter/data/ripository/auth/auth_repository_impl.dart';
import 'package:spotify_clone_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/auth_repository.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/auth/sign_in.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/auth/sign_up.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
}