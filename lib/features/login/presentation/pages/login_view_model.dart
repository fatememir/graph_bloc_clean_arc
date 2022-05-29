import 'package:flutter/material.dart';

import 'authentication_arguments.dart';

class LoginViewModel extends ChangeNotifier {
  final myController = TextEditingController();
  LoginMethod loginMethod = LoginMethod.phone;

  LoginViewModel() {
    myController.addListener(() {
      isValidInput();
      notifyListeners();
    });
  }

  bool isValidInput() {
    var text = myController.value.text;
    if (myController.value.text.startsWith("09")) {
      return isValidPhone(text);
    } else {
      return isValidEmail(text);
    }
  }

  bool isValidPhone(String enteredPhone) {
    if (enteredPhone.length == 11 && enteredPhone.startsWith("09")) {
      loginMethod = LoginMethod.phone;
      return true;
    } else {
      return false;
    }
  }

  bool isValidEmail(String enteredEmail) {
    if (RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(enteredEmail)) {
      loginMethod = LoginMethod.email;
    }
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(enteredEmail);
  }
}