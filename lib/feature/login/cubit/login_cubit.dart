import 'package:crypto_exchange/feature/login/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState('', ''));

  void setEmail(String email) {
    emit(LoginState(email, state.password));
  }

  void setPassword(String password) {
    emit(LoginState(state.email, password));
  }

  void setError(LoginError error) {
    emit(LoginState(
      state.email,
      state.password,
      error: error,
    ));
  }
}
