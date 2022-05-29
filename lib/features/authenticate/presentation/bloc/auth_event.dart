
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationEvent {}


class FourNumbersAreEntered extends AuthenticationEvent{
  final String phoneNumber;
  final int code;

  FourNumbersAreEntered({
    required this.phoneNumber,
    required this.code,
  });

}
