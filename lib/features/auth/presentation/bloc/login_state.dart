import 'package:equatable/equatable.dart';
import '../../../../core/error/failure.dart';


abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String token;
  const LoginSuccess(this.token) : super();

  @override
  List<Object> get props => [token];
}

class LoginFailure extends AuthState {
  final Failure failure;
  const LoginFailure(this.failure) : super();

  @override
  List<Object> get props => [failure];
}
