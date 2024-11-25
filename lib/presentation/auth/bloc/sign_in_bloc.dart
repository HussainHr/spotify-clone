import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone_flutter/domain/entities/usecases/auth/sign_in.dart';
import '../../../data/models/auth/sign_in_user.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignInUseCase signInUseCase;

  SignInBloc(this.signInUseCase) : super(SignInInitial()) {
    on<SignInSubmitted>((event, emit) async {
      if (event.email.isEmpty ||
          !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(event.email)) {
        emit(SignInError('Please enter a valid email.'));
        return;
      }

      if (event.password.isEmpty || event.password.length < 6) {
        emit(SignInError('Password must be at least 6 characters.'));
        return;
      }

      emit(SignInLoading());

      var result = await signInUseCase.call(
        params: SignInUserModel(email: event.email, password: event.password),
      );

      result.fold(
            (failure) {
          emit(SignInError(failure.message));
        },
            (success) {
          emit(SignInSuccess());
        },
      );
    });
  }
}
