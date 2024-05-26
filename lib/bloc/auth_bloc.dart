import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);

    on<AuthLogOutRequested>(_onAuthLogOutRequested);
  }

  void _onAuthLoginRequested(
      AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      String email = event.email;
      String password = event.password;

      if (password.length < 6) {
        return emit(AuthFailure(error: "Password length is too short!"));
      }

      await Future.delayed(const Duration(seconds: 3), () {
        return emit(AuthSuccess(uid: "$email $password"));
      });
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void _onAuthLogOutRequested(
      AuthLogOutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 3), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print("$change");
  }

  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition
    super.onTransition(transition);
    print(transition);
  }
}
