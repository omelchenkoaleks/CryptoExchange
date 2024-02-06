class LoginState {
  final String email;
  final String password;

  LoginState(this.email, this.password);

  bool get isEmailValid {
    final emailRegex = RegExp(
        r'^[A-Za-z0-9]+([.\-_][A-Za-z0-9]+)*@[A-Za-z0-9]+([.\-_][A-Za-z0-9]+)*\.[A-Za-z]+$');
    return emailRegex.hasMatch(email) && !email.contains(' ');
  }

  bool get isPasswordValid {
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
    return passwordRegex.hasMatch(password);
  }

  bool get isFieldValid => isEmailValid && isPasswordValid;

  List<Object> get props => [
        email,
        password,
      ];
}
