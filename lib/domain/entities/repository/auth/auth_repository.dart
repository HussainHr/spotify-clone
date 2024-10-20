import 'package:dartz/dartz.dart';
import 'package:spotify_clone_flutter/data/models/auth/create_user_reg.dart';
import 'package:spotify_clone_flutter/data/models/auth/sign_in_user.dart';

abstract class AuthRepository{
  
  Future<Either> signUp(CreateUserReg createUserReg);
  
  Future<Either> signIn(SignInUserModel userModel);
  
}