class AuthenticationArguments {
  final LoginMethod loginMethod;
  final String input;

  AuthenticationArguments(this.loginMethod, this.input);
}

enum LoginMethod { phone, email }