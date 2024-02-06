import 'package:crypto_exchange/feature/verification/cubit/verification_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationCubit extends Cubit<VerificationState> {
  VerificationCubit() : super(VerificationState(''));

  void setEmail(String email) {
    emit(VerificationState(email));
  }
}
