part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class SignInSubmitted extends SignInEvent{
  final String email;
  final String password;

  SignInSubmitted({required this.email, required this.password});
}
