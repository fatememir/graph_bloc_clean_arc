
import 'package:flutter/material.dart';

@immutable
abstract class AuthenticationState {}

class Initial extends AuthenticationState {}

class Loading extends AuthenticationState {}

class ResponseHasData extends AuthenticationState {}

class ResponseDoesntHasData extends AuthenticationState {}

class ResponseHasError extends AuthenticationState {}

