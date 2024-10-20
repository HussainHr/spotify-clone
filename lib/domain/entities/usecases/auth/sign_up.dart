import 'package:dartz/dartz.dart';
import 'package:spotify_clone_flutter/core/usecases/usecase.dart';
import 'package:spotify_clone_flutter/data/models/auth/create_user_reg.dart';
import 'package:spotify_clone_flutter/domain/entities/repository/auth/auth_repository.dart';

import '../../../../service_locator.dart';

class SignUpUseCase implements UseCase<Either, CreateUserReg> {
  @override
  Future<Either> call({CreateUserReg? params}) {
    return sl<AuthRepository>().signUp(params!);
  }
}
