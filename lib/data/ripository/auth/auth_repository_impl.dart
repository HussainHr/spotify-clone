import 'package:dartz/dartz.dart';
import 'package:spotify_clone_flutter/data/models/auth/create_user_reg.dart';
import 'package:spotify_clone_flutter/data/models/auth/sign_in_user.dart';
import 'package:spotify_clone_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/auth/auth_repository.dart';

import '../../../service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  
  @override
  Future<Either> signIn(SignInUserModel userModel) async{
    return await sl<AuthFirebaseService>().signIn(userModel);
  }

  @override
  Future<Either> signUp(CreateUserReg createUserReg) async{
   return await sl<AuthFirebaseService>().signUp(createUserReg);
  }
  
}