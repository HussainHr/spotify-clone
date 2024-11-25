import 'package:dartz/dartz.dart';
import 'package:spotify_clone_flutter/core/usecases/usecase.dart';
import 'package:spotify_clone_flutter/data/models/auth/sign_in_user.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/auth/auth_repository.dart';

import '../../../../service_locator.dart';

class SignInUseCase implements UseCase<Either, SignInUserModel> {
  @override
  Future<Either> call({SignInUserModel? params}) {
    return sl<AuthRepository>().signIn(params!);
  }
}
