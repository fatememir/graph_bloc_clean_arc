
import 'package:flutter/material.dart';

@immutable
abstract class LoginState {}

class Initial extends LoginState {}

class Loading extends LoginState {}

class ResponseHasData extends LoginState {}

class ResponseDoesntHasData extends LoginState {}

class ResponseHasError extends LoginState {}