import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jan_with_base/features/splash_screen/presentation/bloc/splash_event.dart';
import 'package:jan_with_base/features/splash_screen/presentation/bloc/splash_state.dart';


class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {

  SplashScreenBloc(Initial initial, {
    Key? key
    // required this.navigatorKey
    // @required this.authenticationBloc,
  })  : super(Initial());
  // SplashScreenBloc(super.initialState);


  @override
  SplashScreenState get initialState => Initial();

  @override
  Stream<SplashScreenState> mapEventToState(
      SplashScreenEvent event,
      ) async* {
    if (event is NavigateToGratitudeScreenEvent) {
      yield Loading();

      // During the Loading state we can do additional checks like,
      // if the internet connection is available or not etc..

      await Future.delayed(Duration(seconds: 3)); // This is to simulate that above checking process
      yield Loaded(); // In this state we can load the HOME PAGE
    }
  }
}