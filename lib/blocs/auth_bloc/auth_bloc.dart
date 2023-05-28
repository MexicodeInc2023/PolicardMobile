import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:policard_mobile/repository/repo_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthLoading()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final result = await _authRepo.login(event.email, event.password);
        if (result != "Email Not found." && result != "Invalid Password!") {
          print("Usuario autenticado");
          emit(AuthSuccessful());
        } else {
          print("Usuario o contraseña incorrectos");
          emit(AuthFailed(message: "Usuario o contraseña incorrectos"));
        }
      } catch (e) {
        print("Error durante el inicio de sesión: $e");
        emit(AuthFailed(message: "Error durante el inicio de sesión"));
      }
    });
  }
}

