part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccessful extends AuthState {
  final String? token;

  AuthSuccessful({this.token});

  @override
  List<Object?> get props => [token];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthFailed extends AuthState {
  String? message;
  AuthFailed({this.message});
  @override
  List<Object?> get props => [message];
}
