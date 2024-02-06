class VerificationState {
  final String email;

  VerificationState(this.email);

  bool get isEmailValid {
    final emailRegex = RegExp(
        r'^[A-Za-z0-9]+([.\-_][A-Za-z0-9]+)*@[A-Za-z0-9]+([.\-_][A-Za-z0-9]+)*\.[A-Za-z]+$');
    return emailRegex.hasMatch(email) && !email.contains(' ');
  }

  List<Object> get props => [
        email,
      ];
}
