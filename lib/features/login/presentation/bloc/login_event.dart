
import 'package:flutter/material.dart';

@immutable
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent{
  final String phoneNumber;

   LoginButtonPressed({
    required this.phoneNumber,
  });

}
